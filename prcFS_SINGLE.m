% MODULUS
%   this script contains the full process of a run for IR


clc;
clear all;


% init
    idc_mix = 0;
    % this is an indicator for the number of grains involved
    % for prcFS, it is initiated with 0 and will be altered in mod4postFSPEC
    % 1 for 1 grain type
    % 2 for 2 grain types

    mod1CONSTANTS_r3
    mod2preSINGLE_pseudo
% end init


% main
    fprintf('PROCESSING 1\n');
    mod2SIGNAL_r3
    mod3FSPEC_r4
    mod4et5preFILTER

    fampth = 0;
    done_mod4 = 0;
    while ~done_mod4
        mod4FSMETHOD_t3

        max_famp = max(peak.famp, [], 'all');
        ctr_zeropeak = size(find(peak.ctr == 0), 2);
        ctr_onepeak = size(find(peak.ctr == 1), 2);
        ctr_twopeak = size(find(peak.ctr == 2), 2);
        ctr_mulpeak = size(find(peak.ctr > 2), 2);
        sum_mulpeak = sum(peak.ctr(find(peak.ctr > 2)));
        
        famp_sorted = sort(peak.famp(:), 'descend');
        famp_g1 = famp_sorted(1 : vsc.n_step);
        famp_g2 = famp_sorted((vsc.n_step + 1) : (2 * vsc.n_step));
        famp_g3 = famp_sorted((2 * vsc.n_step + 1) : sum(peak.ctr));
        avg_famp_g1 = mean(famp_g1);
        std_famp_g1 = std(famp_g1);
        avg_famp_g2 = mean(famp_g2);
        std_famp_g2 = std(famp_g2);
        avg_famp_g3 = mean(famp_g3);
        std_famp_g3 = std(famp_g3);
        
%         noise_famp = peak.famp;
%         for ctr_famp = 1 : (2 * vsc.n_step)
%             max_famp = max(noise_famp, [], 'all');
%             [max_famp_row, max_famp_col] = find(noise_famp == max_famp, 1);
%             noise_famp(max_famp_row, max_famp_col) = 0;
%         end
%         sum_noise = sum(sum(noise_famp));
%         
%         fampth = max_famp / 25;
%         if (sum_mulpeak > (4 * ctr_mulpeak))
%             fampth = fampth + 1e-4;
%            % fampth = fampth + (max_famp / 10 - fampth) * (sum_mulpeak / ctr_mulpeak - 2) / 20;
%         elseif ctr_zeropeak
%         end
    end
        
    % fampth_adj = 0;
    % done_mod4 = 0;
    % while done_mod4 ~= 3

    %     mod4FSMETHOD_t3

    %     ctr_zeropeak = size(find(peak.ctr == 0), 2);
    %     ctr_onepeak = size(find(peak.ctr == 1), 2);
    %     ctr_twopeak = size(find(peak.ctr == 2), 2);
    %     ctr_mulpeak = size(find(peak.ctr > 2), 2);

    %     if ctr_zeropeak % threshold should allow at least one peak for each angle
    %         fampth_adj = -fampth * (ctr_zeropeak / vsc.n_step);
    %         done_mod4 = 0;
    %     elseif ~done_mod4
    %         done_mod4 = 1;
    %     end

    %     if done_mod4 == 1
    %     noise_famp = peak.famp;
    %         for ctr_noiseth = 1 : (3 * vsc.n_step)
    %             max_famp = max(noise_famp, [], 'all');
    %             [max_famp_row, max_famp_col] = find(noise_famp == max_famp, 1);
    %             noise_famp(max_famp_row, max_famp_col) = 0;
    %             if ctr_noiseth == 1
    %                 min_fampth = max_famp / 20;
    %             end
    %         end
    %         fampth_adj = max(noise_famp, [], 'all') - fampth + min_fampth;
    %         done_mod4 = 2;
    %     elseif done_mod4 == 2
    %         done_mod4 = 3;
    %     end
    % end

    mod4postFSPEC_t1

    if idc_mix == 2
        abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 2);
        mod5IRMETHODp1et2_t4
        mod5IRMETHODp3_t1
        val_corr_g2 = val_corr;
    end
    
    abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 1);
    mod5IRMETHODp1et2_t4
    mod5IRMETHODp3_t1
% end main


% OUTPUT save
    fprintf('ARCHIVING\n');
    load('.\ACVSG\acvmgr.mat');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACVSG\\ACV%d_FS.mat', ctr_acv);
    save(str_acv, 'ctr_acv', 'SC', 'initg1', 'initg2', 'val_corr', 'val_corr_g2', 'vsc', 'idc_mix');
    save('.\ACVSG\acvmgr.mat', 'ctr_acv');
    % clear all;
    fprintf('FS_SIM DONE\n\n');
% end output save
