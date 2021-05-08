% MODULUS 4postFSPEC_t1
%   regenerate frequency spectrum
%   using peak
%   if most of them contain only one peak
%       the origin filtered frequency spectrum is kept
%   if most of them contain more than one peak
%       for g1 find one with largest amplitude
%       for g2 find another furthest away in frequency from the previous one


% init
    % storage
    abfil_fpspec_simdata = zeros(size(IRDB.abfil_ft, 2), vsc.n_step);
% end init




% % process
%     if 
%     for ctr_refspec = 1 : vsc.n_step
%         abfil_fpspec_simdata(peak.oidx(1 : peak.ctr(ctr_refspec), ctr_refspec), ctr_refspec) =...
%             peak.famp(1 : peak.ctr(ctr_refspec), ctr_refspec);
%     end
% % end process