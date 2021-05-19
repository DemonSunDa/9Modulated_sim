% MODULUS 4postFSPEC_t1
%   regenerate frequency spectrum
%   using peak
%   if most of them contain only one peak
%       the origin filtered frequency spectrum is kept
%   if most of them contain more than one peak
%       for g1 find one with largest amplitude
%       for g2 second largest amplitude is looked for
%       if not exits for ceretain angle, g1 freq with threshold amp is used


% init
    if ctr_onepeak >= (vsc.n_step * fampth * 20)
        idc_mix = 1; % indicate a mixture of grain type
    else
        idc_mix = 2; % indicate one grain type
    end

    % storage
    abfil_fpspec_regen = zeros(size(IRDB.abfil_ft, 2), vsc.n_step, idc_mix);
% end init


% regen
    [arrg1_max_famp, arrg1_max_ind] = max(peak.famp);
    for ctr_recol = 1 : vsc.n_step
        abfil_fpspec_regen(peak.idx(arrg1_max_ind(ctr_recol), ctr_recol), ctr_recol, 1) = arrg1_max_famp(ctr_recol);
    end
    if idc_mix == 2
        peak_temp = peak.famp;
        for ctr_remax = 1 : vsc.n_step
            peak_temp(arrg1_max_ind(ctr_remax), ctr_remax) = 0; % clear g1
        end

        [arrg2_max_famp, arrg2_max_ind] = max(peak_temp);
        for ctr_recol = 1 : vsc.n_step
            if peak.ctr(ctr_recol) > 1 % if second max exists
                abfil_fpspec_regen(peak.idx(arrg2_max_ind(ctr_recol), ctr_recol), ctr_recol, 2)...
                    = arrg2_max_famp(ctr_recol);
            else
                abfil_fpspec_regen(peak.idx(arrg1_max_ind(ctr_recol), ctr_recol), ctr_recol, 2)...
                    = fampth;
            end
        end
    end
% end regen

% save('.\mat\4post_regen', 'abfil_fpspec_regen');
