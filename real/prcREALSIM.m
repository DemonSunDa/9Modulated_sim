clc;
clear all;

mod1CONSTANTS_r3
mod2preSINGLE_pseudo
mod2SIGNAL_r3
mod3FSPEC_r4
mod3postSIM
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

    if sum_mulpeak >= (2 * vsc.n_step) % half angles with 4 peaks detected
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

        fampth = avg_famp_g3 + std_famp_g3;
    else
        done_mod4 = 1;
    end
end

% mod4postFSPEC_t1
% mod4postFSPEC_t2
mod4postFSPEC_t3

if idc_mix == 2
    abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 2);
    mod5IRMETHODp1et2_t4
    mod5IRMETHODp3_t1
    val_corr_g2 = val_corr;
end

abfil_fpspec_simdata = abfil_fpspec_regen(:, :, 1);
mod5IRMETHODp1et2_t4
mod5IRMETHODp3_t1
