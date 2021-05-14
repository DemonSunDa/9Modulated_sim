% MODULUS
%   this script contains the full process of multiple runs
%   with no prompted input


profile on;
clc;
clear all;


% init
    idc_mix = 1;
    % this is an indicator for the number of grains involved
    % for prcIR, since there is no way to identify if there are two grins or not
    % the inicator is set to 1 which means 1 grain type

    mod1CONSTANTS_r3
    
    % define loop info
        vec.g1_prop = (0 : 0.1 : 1);
        vec.n_fringe = [4, 8, 12, 16];
        vec.n_step = [9, 12, 15, 18, 36, 90, 180];
        vec.noise_level = (0 : 0.05 : 1);

        % vec.x = linspace(DB.x_cut(1) , DB.x_cut(size(DB.x_cut, 2)), 2) + 0; % for vec size 21, 11, 6, 3 etc
        % vec.y = linspace(DB.y_cut(1) , DB.y_cut(size(DB.y_cut, 2)), 2) + 0;
        % vec.deg = linspace(0, 179, 180) - 0;
        vec.x = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
        vec.y = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
        vec.deg = 0 : 15 : 165;
    % end define loop info
    
    mod2preMASSp1
    
    % system config selection
        sel.g1_prop = [11];
        % * 1 (mono grain) when 11
        % ! IMPORTANT DO NOT MIX ITERATIONS WITH ONE GRAIN TO TWO GRAINS
        % * 0.6 when 7
        sel.n_fringe = [3];
        % * 12 fringes when 11
        sel.n_step = [5];
        % * 18 steps when 4
        % * 36 steps when 5
        sel.noise_level = 8 : 11;
        % * 0 noise when 1
        % * 0.15 noise when 4

        % define expecting size of the result
        if sel.g1_prop == 11
        % * if the g1_prop is 1 where g2 does not involve, iterations for g2 is depressed
            sz_simresult = [sz_mat_graintype, 1,...
                size(sel.g1_prop, 2), size(sel.n_fringe, 2),...
                size(sel.n_step, 2), size(sel.noise_level, 2)];
            % * ctr_d2  graintype of g1
            % * ctr_d2e graintype of g2
        else
            sz_simresult = [sz_mat_graintype, sz_mat_graintype,...
                size(sel.g1_prop, 2), size(sel.n_fringe, 2),...
                size(sel.n_step, 2), size(sel.noise_level, 2)];
        end
    % end selection
    
    % storage
    stArr_simresult(1:sz_simresult(1), 1:sz_simresult(2),...
        1:sz_simresult(3), 1:sz_simresult(4),...
        1:sz_simresult(5), 1:sz_simresult(6))...
        = struct(...
        'initg1', struct(),...
        'initg2', struct(),...
        'val_corr', [],...
        'vsc', struct(),...
        'snr_simdata', [],...
        'idc_mix', 1);
% end init


% main
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
        fprintf('PROCESSING\t%d_%d_%d_%d,\t%d\t/ %d\t\t%d\t/ %d\n',...
            ctr_d5, ctr_d4e, ctr_d4, ctr_d3,...
            ctr_d2e, sz_simresult(2), ctr_d2, sz_simresult(1));
        mod2SIGNAL_r3
        mod3FSPEC_r4
        mod4et5preFILTER
        mod5IRMETHODp1et2_t4
        mod5IRMETHODp3_t1

        % store grain info and vsc and result into archived foramt
        stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5)...
            = struct(...
            'initg1', initg1,...
            'initg2', initg2,...
            'val_corr', val_corr,...
            'vsc', vsc,...
            'snr_simdata', snr_simdata,...
            'idc_mix', 1);
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
    fprintf('ARCHIVING\n');
    load('.\ACVMS\acvmgr.mat');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACVMS\\ACV%d_IR.mat', ctr_acv);
    save(str_acv, 'SC', 'stArr_simresult', 'ctr_acv', 'vec', 'sel', 'sz_simresult');
    save('.\ACVMS\acvmgr.mat', 'ctr_acv');
    % clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save

profile viewer;
