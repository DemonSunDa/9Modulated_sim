% MODULUS
%   this script contains the full process of multiple runs
%   with no prompted input


clc;
clear all;


% init
    mod1CONSTANTS_r3
    mod2preMASSp1

    vec_g1_prop = (0 : 0.1 : 1);
    vec_n_step = [9, 12, 15, 18, 30, 36];
    vec_n_fringe = (2 : 1 : 12);
    vec_noise_level = (0 : 0.05 : 0.5);

    % storage
    stArr_simresult(1:sz_mat_graintype, 1:1, 1:1, 1:1, 1:1, 1:1) =struct(...
        'initg1', struct(),...
        'initg2', struct(),...
        'val_corr', [],...
        'vsc', struct()...
    );
% end init


% main
    % waitbar init
    % waitbar is for indication only, comment out if necessary
    % f_waitbar = waitbar(0, '10', 'Name', 'IR_SIM');
    tic;
    for ctr_d5 = 1 : 4 % loop for noise_level
        noise_level = vec_noise_level(ctr_d5);

        for ctr_d4e = 4 : 4 % loop for n_step
        % 18 steps when 4
        % 36 steps when 6
            n_step = vec_n_step(ctr_d4e);
            
            for ctr_d4 = 11 : 11 % loop for n_fringe
            % fixed onto 12 fringes
                n_fringe = vec_n_fringe(ctr_d4);

                for ctr_d3 = 11 : 11 % loop for g1_prop
                % for mono grain g1_prop is constant 1 whose idx = 11
                    g1_prop = vec_g1_prop(ctr_d3);

                    for ctr_d2e = 1 : sz_mat_graintype % loop for graintype of g2
                        
                        for ctr_d2 = 1 : sz_mat_graintype % loop for graintype of g1

                            % tic;
                            mod2preMASSp2
                            fprintf('PROCESSING\t%d_%d_%d_%d,\t%d\t/ %d\t\t%d\t/ %d\n', ctr_d5, ctr_d4e, ctr_d4, ctr_d3, ctr_d2e, sz_mat_graintype, ctr_d2, sz_mat_graintype);
                            % waitbar(ctr_d2 / sz_mat_graintype, f_waitbar,...
                            %     sprintf('PROCESSING %d\n%d / %d', ctr_d5, ctr_d2, sz_mat_graintype))
                            mod2SIGNAL_r3
                            mod3FSPEC_r4
                            mod4et5preFILTER
                            mod5IRMETHODp1et2_t4
                            mod5IRMETHODp3_t1

                            % store grain info and vsc and result into archived foramt
                            stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5) = struct(...
                                'initg1', initg1,...
                                'initg2', initg2,...
                                'val_corr', val_corr,...
                                'vsc', vsc...
                            );
                            % toc;
                        end
                    end
                end
            end
        end
    end
    toc;
% end main


% OUTPUT save
    % save('.\mat\6stArr_simresult', 'stArr_simresult');
    fprintf('ARCHIVING\n');
    % clear variables;
    load('.\ACVMS\acvmgr.mat');
    % load('.\mat\1CONSTANTS.mat', 'SC');
    % load('.\mat\6stArr_simresult');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACVMS\\IR_ACV%d.mat', ctr_acv);
    save(str_acv, 'SC', 'stArr_simresult', 'ctr_acv');
    save('.\ACVMS\acvmgr.mat', 'ctr_acv');
    clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save
