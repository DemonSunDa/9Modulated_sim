% MODULUS 4postFSPEC
%   regenerate frequency spectrum
%   using peak
%   keep all the peaks with their amplitude


% init
    % storage
    abfil_fpspec_simdata = zeros(size(IRDB.abfil_ft, 2), vsc.n_step);
% end init
    
    
% main
    for ctr_refspec = 1 : vsc.n_step
        abfil_fpspec_simdata(peak.oidx(1 : peak.ctr(ctr_refspec), ctr_refspec), ctr_refspec) =...
            peak.famp(1 : peak.ctr(ctr_refspec), ctr_refspec);
    end
% end main