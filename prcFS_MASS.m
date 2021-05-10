% MODULUS
%   this script contains the full process of multiple runs
%   with no prompted input

profile on;
clc;
clear all;


% init
    mod1CONSTANTS_r3
    
    % define loop info
        vec.g1_prop = (0 : 0.1 : 1);
        vec.n_fringe = (2 : 1 : 12);
        vec.n_step = [9, 12, 15, 18, 30, 36];
        vec.noise_level = (0 : 0.05 : 0.5);

        % vec.x = linspace(DB.x_cut(1) , DB.x_cut(size(DB.x_cut, 2)), 2) + 0; % for vec size 21, 11, 6, 3 etc
        % vec.y = linspace(DB.y_cut(1) , DB.y_cut(size(DB.y_cut, 2)), 2) + 0;
        % vec.deg = linspace(0, 179, 180) - 0;
        vec.x = [0, 0.5, 1];
        vec.y = [0, 0.5, 1];
        vec.deg = [0, 30, 60, 90, 120, 150];
    % end define loop info
    
    mod2preMASSp1
    
    sel.g1_prop = [7];
    % * 1 (mono grain) when 11
    % * 0.6 when 7
    sel.n_fringe = [11];
    % * 12 fringes when 11
    sel.n_step = [4];
    % * 18 steps when 4
    sel.noise_level = [3];
    % * 0 noise when 1
    
    % define expecting size of the result    
    sz_simresult = [sz_mat_graintype, sz_mat_graintype,...
        size(sel.g1_prop, 2), size(sel.n_fringe, 2),...
        size(sel.n_step, 2), size(sel.noise_level, 2)];
    % * ctr_d2  graintype of g1
    % * ctr_d2e graintype of g2
    
    % storage
    stArr_simresult(1:sz_simresult(1), 1:sz_simresult(2),...
        1:sz_simresult(3), 1:sz_simresult(4),...
        1:sz_simresult(5), 1:sz_simresult(6))...
        = struct(...
        'idc_mix', 0,...
        'initg1', struct(),...
        'initg2', struct(),...
        'val_corr', [],...
        'val_corr_g2', [],...
        'vsc', struct()...
    );
% end init


% main
    % // waitbar init
    % // waitbar is for indication only, comment out if necessary
    % // f_waitbar = waitbar(0, '10', 'Name', 'IR_SIM');
    tic;
    for ctr_d5 = 1 : sz_simresult(6) % loop for noise_level
    noise_level = vec.noise_level(sel.noise_level(ctr_d5));

    for ctr_d4e = 1 : sz_simresult(5) % loop for n_step
    n_step = vec.n_step(sel.n_step(ctr_d4e));
            
    for ctr_d4 = 1 : sz_simresult(4) % loop for n_fringe
    n_fringe = vec.n_fringe(sel.n_fringe(ctr_d4));

    for ctr_d3 = 1 : sz_simresult(3) % loop for g1_prop
    g1_prop = vec.g1_prop(sel.g1_prop(ctr_d3));
    % for mono grain g1_prop is constant 1 whose idx = 11
                    
    for ctr_d2e = 1 : sz_simresult(2) % loop for graintype of g2
                        
    for ctr_d2 = 1 : sz_simresult(1) % loop for graintype of g1

        % tic;
        mod2preMASSp2
        fprintf('PROCESSING\t%d_%d_%d_%d,\t%d\t/ %d\t\t%d\t/ %d\n', ctr_d5, ctr_d4e, ctr_d4, ctr_d3, ctr_d2e, sz_mat_graintype, ctr_d2, sz_mat_graintype);
        % //  waitbar(ctr_d2 / sz_mat_graintype, f_waitbar,...
        % //     sprintf('PROCESSING %d\n%d / %d', ctr_d5, ctr_d2, sz_mat_graintype))
        mod2SIGNAL_r3
        mod3FSPEC_r4
        mod4et5preFILTER

        fampth_adj = 0;
        ctr_mod4 = 0;
        done_mod4 = 0;
        while done_mod4 ~= 3
            ctr_mod4 = ctr_mod4 + 1;

            mod4FSMETHOD_t3

            ctr_zeropeak = size(find(peak.ctr == 0), 2);
            ctr_onepeak = size(find(peak.ctr == 1), 2);
            ctr_twopeak = size(find(peak.ctr == 2), 2);
            ctr_mulpeak = size(find(peak.ctr > 2), 2);

            if ctr_zeropeak
                fampth_adj = -fampth * (ctr_zeropeak / vsc.n_step);
                done_mod4 = 0;
            elseif ~done_mod4
                done_mod4 = 1;
            end

            if done_mod4 == 1
            noise_famp = peak.famp;
                for ctr_noiseth = 1 : (3 * vsc.n_step)
                    max_famp = max(noise_famp, [], 'all');
                    [max_famp_row, max_famp_col] = find(noise_famp == max_famp, 1);
                    noise_famp(max_famp_row, max_famp_col) = 0;
                    if ctr_noiseth == 1
                        min_fampth = max_famp / 20;
                    end
                end
                fampth_adj = max(noise_famp, [], 'all') - fampth + min_fampth;
                done_mod4 = 2;
            elseif done_mod4 == 2
                done_mod4 = 3;
            end
        end

        mod4postFSPEC_t2

        if idc_mix == 2
            abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 2);
            mod5IRMETHODp1et2_t4
            mod5IRMETHODp3_t1
            val_corr_g2 = val_corr;
        end
        
        abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 1);
        mod5IRMETHODp1et2_t4
        mod5IRMETHODp3_t1

        % store grain info and vsc and result into archived foramt
        stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5) = struct(...
            'initg1', initg1,...
            'initg2', initg2,...
            'val_corr', val_corr,...
            'val_corr_g2', [],...
            'vsc', vsc...
        );
        if exist('val_corr_g2', 'var')
            stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr_g2...
                = val_corr_g2;
        end
        % toc;
    end % ctr_d2
    end % ctr_d2e
    end % ctr_d3
    end % ctr_d4
    end % ctr_d4e
    end % ctr_d5
    toc;
% end main


% OUTPUT save
    % // save('.\mat\6stArr_simresult', 'stArr_simresult');
    fprintf('ARCHIVING\n');
    % // clear variables;
    load('.\ACVMS\acvmgr.mat');
    % // load('.\mat\1CONSTANTS.mat', 'SC');
    % // load('.\mat\6stArr_simresult');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACVMS\\IR_ACV%d.mat', ctr_acv);
    save(str_acv, 'SC', 'stArr_simresult', 'ctr_acv', 'vec', 'sel', 'sz_simresult', 'reval');
    save('.\ACVMS\acvmgr.mat', 'ctr_acv');
    % clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save

profile viewer;
