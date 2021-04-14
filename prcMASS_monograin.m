% MODULUS
%   this script contains the full process of multiple runs
%   with no prompted input


clc;
clear variables;


% % INPUT initial state
%     fprintf('Mode = %d\n', SC.mode);
%     fprintf('Wavelength = %.2f um\n', SC.lambda * 1e6);
%     fprintf('Distance from centre of generation patch to detection beam = %.2f um\n', SC.d_gc2d * 1e6);
%     
%     vsc.noise_level = input('Noise level (in percentage) = ') / 100;
%     
%     vsc.n_fringe = input('Fringe number = '); % when 10
%     vsc.patch = SC.lambda * vsc.n_fringe; % equal to 200e-6
%     
%     vsc.n_step = input('Number of rotation steps = ');
%     vsc.deg_step = 180 / vsc.n_step;
%     
%     initg1.prop = input('Grain 1 proportion (in percentage) = ') / 100;
%     initg2.prop = 1 - initg1.prop;
%     initg1.d_2d = SC.d_gc2d - initg2.prop * vsc.patch / 2; % distance from centre of g1 to detection beam
%     initg2.d_2d = SC.d_gc2d + initg1.prop * vsc.patch / 2; % distance from centre of g2 to detection beam
%     
%     fprintf('INPUT GRAIN1 ORIENTATION\n');
%     fprintf('(the grain closer to detection beam)\n');
%     [initg1.x_miller, initg1.y_miller, initg1.deg] = gparams_IN();
%     fprintf('INPUT GRAIN2 ORIENTATION\n');
%     [initg2.x_miller, initg2.y_miller, initg2.deg] = gparams_IN();
% % end input initial state


% main
    mod1CONSTANTS_r3
    mod2preMASSp1
    
    vec_g1_prop = (0 : 0.1 : 1);
    vec_n_fringe = (2 : 1 : 12);
    vec_noise_level = (0 : 0.05 : 0.5);
    
    for ctr_d5 = 1 : 1 % loop for noise_level
        noise_level = vec_noise_level(ctr_d5);

        for ctr_d4 = 11 : 11 % loop for n_fringe
        % fixed onto 12 fringes
            n_fringe = vec_n_fringe(ctr_d4);

            for ctr_d3 = 11 : 11 % loop for g1_prop
            % for mono grain g1_prop is constant 1 whose idx = 11
                g1_prop = vec_g1_prop(ctr_d3);

                for ctr_d2 = 1 : sz_mat_graintype % loop for graintype
                    mod2preMASSp2
                    mod2SIGNAL_r3
                    mod3FSPEC_r4
                    mod5IRMETHODp1et2_t4
                    mod5IRMETHODp3_t1
                end
            end
        end
    end
% end main


% OUTPUT save
    fprintf('ARCHIVING\n');
    clear variables;
    load('.\ACV\acvmgr.mat');
    load('.\mat\1CONSTANTS.mat');
    load('.\mat\2cal_simdata.mat');
    load('.\mat\5IRDB.mat');
    load('.\mat\5irc_simresult.mat');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACV\\IR_ACV%d.mat', ctr_acv);
    save(str_acv);
    save('.\ACV\acvmgr.mat', 'ctr_acv');
    clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save
