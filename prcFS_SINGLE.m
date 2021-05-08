% MODULUS
%   this script contains the full process of a run for IR


clc;
clear all;


% main
    mod1CONSTANTS_r3
    mod2preSINGLE
    fprintf('PROCESSING 1\n');
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

    if idc_mix == 1
        abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 1);
        mod5IRMETHODp1et2_t4
        mod5IRMETHODp3_t1
    else
        abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 2);
        mod5IRMETHODp1et2_t4
        mod5IRMETHODp3_t1
        val_corr_g2 = val_corr;

        abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 1);
        mod5IRMETHODp1et2_t4
        mod5IRMETHODp3_t1
    end
% end main


% OUTPUT save
    fprintf('ARCHIVING\n');
    load('.\ACVSG\acvmgr.mat');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACVSG\\IR_ACV%d.mat', ctr_acv);
    save(str_acv, 'ctr_acv', 'SC', 'initg1', 'initg2', 'val_corr', 'val_corr_g2', 'vsc');
    save('.\ACVSG\acvmgr.mat', 'ctr_acv');
    % clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save
