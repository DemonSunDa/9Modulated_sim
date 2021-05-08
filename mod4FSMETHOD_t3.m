% MODULUS 4FSMETHOD
%   
% DEPENDENCY
%   1CONSTANTS.mat
%   2cal_simdata.mat (for vsc)
%   2signal_simdata.mat
%   3fpspec_simdata.mat
% FILE OUTPUT
%   4peak_simdata.mat


% clc;
% clear variables;
% load('.\mat\1CONSTANTS.mat');
% load('.\mat\2cal_simdata.mat');
% load('.\mat\2signal_simdata.mat');
% load('.\mat\3fpspec_simdata.mat');


% init
    peak.famp = zeros(20, vsc.n_step); % store peak amp (size of 20 to store extra peaks)
    peak.freq = zeros(20, vsc.n_step); % store peak f
    peak.idx = zeros(20, vsc.n_step); % store peak f index in afil_f
    peak.oidx = zeros(20, vsc.n_step); % store peak f index in original fp_ft
    peak.ctr = zeros(1, vsc.n_step); % peak counter
% end init
    

% FILTER needed here

        
% peak detection
    fampth = 0.02; % set base threshold for amp of f spectrum
    if exist('fampth_adj', 'var') % if a fampth_adj is used
        fampth = fampth + fampth_adj; % adjust fampth
    end
    
    for ctr_pdm = 1 : vsc.n_step % loop all angles
        for ctr_pds = 2 : (size(abfil_fpspec_simdata, 1) - 1) % loop all data point
            if (abfil_fpspec_simdata(ctr_pds - 1, ctr_pdm) < abfil_fpspec_simdata(ctr_pds, ctr_pdm))...
                    && (abfil_fpspec_simdata(ctr_pds, ctr_pdm) > abfil_fpspec_simdata(ctr_pds + 1, ctr_pdm))...
                    && (abfil_fpspec_simdata(ctr_pds, ctr_pdm) > fampth)
                % peak shape & amp > fampth
                peak.famp(peak.ctr(ctr_pdm) + 1, ctr_pdm) = abfil_fpspec_simdata(ctr_pds, ctr_pdm);
                peak.freq(peak.ctr(ctr_pdm) + 1, ctr_pdm) = IRDB.abfil_ft(ctr_pds);
                peak.idx(peak.ctr(ctr_pdm) + 1, ctr_pdm) = ctr_pds;
                peak.oidx(peak.ctr(ctr_pdm) + 1, ctr_pdm) = ctr_pds + fth.valmin_col - 1;
                peak.ctr(ctr_pdm) = peak.ctr(ctr_pdm) + 1;
            end
        end
    end
% end peak detection


% OUTPUT save
    % save('.\mat\4peak_simdata.mat', 'peak');
    % fprintf('FSMETHOD DONE\n');
% end output save
