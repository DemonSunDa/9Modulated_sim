% MODULUS
%   this script contains the full process of a run for IR


clc;
clear all;


% main
    mod1CONSTANTS_r3
    mod2preSINGLE_pseudo
    fprintf('PROCESSING 1\n');
    mod2SIGNAL_r3
    mod3FSPEC_r4
    mod4et5preFILTER
    
    if 1 % whether to use a floating threshold
        fampth_adj = 0;
        fampth_adj_pre = 1;
        ctr_mod4 = 0;
        done_mod4 = 0;
        while ~(ctr_mod4 && (done_mod4 ~= 2) && ((fampth_adj - fampth_adj_pre) < 1e-5))
            ctr_mod4 = ctr_mod4 + 1;
            fampth_adj_pre = fampth_adj;

            mod4FSMETHOD_t3

            ctr_zeropeak = size(find(peak.ctr == 0), 2);
            ctr_onepeak = size(find(peak.ctr == 1), 2);
            ctr_twopeak = size(find(peak.ctr == 2), 2);
            ctr_mulpeak = size(find(peak.ctr > 2), 2);

            if ctr_zeropeak && (~done_mod4)
                fampth_adj = -fampth * (ctr_zeropeak / vsc.n_step);
            elseif ctr_mulpeak && (~done_mod4)
                fampth_adj = fampth * (ctr_mulpeak / vsc.n_step);
            else
                done_mod4 = 1;
                fampth_adj = -fampth * (ctr_onepeak / vsc.n_step) / 1000;
                if ctr_mulpeak
                    done_mod4 = 2;
                    fampth_adj = -fampth_adj_pre;
                end
            end
        end
    else
        mod4FSMETHOD_t3
    end
    
    mod4postFSPEC_t1
    save('.\mat\4peak_simdata.mat', 'peak');
    mod5IRMETHODp1et2_t4
    mod5IRMETHODp3_t1
    save('.\mat\5irc_simresult.mat', 'idx_corr', 'val_corr');
% end main


% % OUTPUT save
%     fprintf('ARCHIVING\n');
%     load('.\ACVSG\acvmgr.mat');
%     ctr_acv = ctr_acv + 1;
%     str_acv = sprintf('.\\ACVSG\\IR_ACV%d.mat', ctr_acv);
%     save(str_acv, 'ctr_acv', 'SC', 'initg1', 'initg2', 'val_corr', 'vsc');
%     save('.\ACVSG\acvmgr.mat', 'ctr_acv');
%     % clear all;
%     fprintf('IR_SIM DONE\n\n');
% % end output save
