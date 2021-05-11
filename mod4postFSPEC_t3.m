% MODULUS 4postFSPEC_t1
%   regenerate frequency spectrum
%   using peak
%   if most of them contain only one peak
%       the origin filtered frequency spectrum is kept
%   if most of them contain more than one peak
%       for g1 find one with largest amplitude
%       for g2 peak farthest away from maxima is looked for
%           if only one peak exist for this angle
%           use this one with fampth


% init
    if ctr_onepeak <= (vsc.n_step * fampth * 20)
        idc_mix = 2; % indicate a mixture of grain type
    else
        idc_mix = 1; % indicate one grain type
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
        arrg2_max_famp = zeros(1, vsc.n_step);
        arrg2_max_ind = zeros(1, vsc.n_step);
        for ctr_remax = 1 : vsc.n_step
            [arrg2_max_famp(ctr_remax), arrg2_max_ind(ctr_remax)] = max(abs(peak.freq(1 : peak.ctr(ctr_remax), ctr_remax) - peak.freq(arrg1_max_ind(ctr_remax), ctr_remax)));
            if arrg2_max_ind(ctr_remax) ~= arrg2_max_ind(ctr_remax)
                abfil_fpspec_regen(peak.idx(arrg2_max_ind(ctr_remax), ctr_remax), ctr_remax, 2)...
                    = arrg2_max_famp(ctr_remax);
            else
                abfil_fpspec_regen(peak.idx(arrg2_max_ind(ctr_remax), ctr_remax), ctr_remax, 2)...
                    = fampth;
            end
        end
    end
% end regen

% save('.\mat\4post_regen', 'abfil_fpspec_regen');
