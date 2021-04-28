% MODULUS 5IRMETHODp1et2
%   
% DEPENDENCY
%   1CONSTANTS.mat
%   2cal_simdata.mat (for vsc)
%   3fpspec_simdata.mat
% FILE OUTPUT
%   5IRDB.mat


% // clear variables;
% // fprintf('5IRMETHODp1et2\nLOADING\n');
% // load('.\mat\1CONSTANTS.mat');
% // load('.\mat\2cal_simdata.mat');
% // load('.\mat\3fpspec_simdata.mat');


% init
    IRDB.sv_m = permute(DB.sv_m(:, :, :, 1), [3, 1, 2]) * 1e3; % ignore mode, rearrange database in m/s
    % IRDB.sv_m(deg, x_miller, y_miller)
    IRDB.sf_m = IRDB.sv_m / SC.lambda; % databse stored in frequency
    
    
    % * FILTER needed here 
    
    
    % storage
    IRDB.abfil_fpspec =...
        zeros(size(IRDB.abfil_ft, 2), size(DB.deg, 2), size(DB.x_cut, 2), size(DB.y_cut, 2));
    % storage only for filtered length
    IRDB.recon_fpspec =...
        zeros(size(IRDB.abfil_ft, 2), vsc.n_step, vsc.deg_step, size(DB.x_cut, 2), size(DB.y_cut, 2));
    % this is dividing 180 degrees into two dimensions d2 and d3 where d2 * d3 =180
    % thus d2 agree with n_step which is the size of simdata
    ircorr_simdata = zeros(vsc.n_step, vsc.deg_step, size(DB.x_cut, 2), size(DB.y_cut, 2));
    % store selected xcorr2 result
% end init


% f spec model gen
% with filter reconstruction and reorder
    for ctr_x = 1 : size(DB.x_cut, 2)
        for ctr_y = 1 : size(DB.y_cut, 2)
            for ctr_deg = 1 : size(DB.deg, 2)
                freq = IRDB.sf_m(ctr_deg, ctr_x, ctr_y);
                freq_idx = find(abs(IRDB.abfil_ft - freq) < (fp_res / 2)); % find frequency on IRDB.abfil_ft
                
                IRDB.abfil_fpspec(freq_idx, ctr_deg, ctr_x, ctr_y) = 1;
                IRDB.recon_fpspec(freq_idx, ceil(ctr_deg / vsc.deg_step),...
                    mod((ctr_deg - 1), vsc.deg_step) + 1, ctr_x, ctr_y) = 1;
                % * this one is used for xcorr
            end
        end
    end
% end f spec model gen


% comparison
    irmodel = [IRDB.recon_fpspec, IRDB.recon_fpspec];
    % avoid directly refer to a large structure in loops
    % * use two matrices concat together to emulate the rotation
    max_ctrx_comp = size(DB.x_cut, 2); % 21
    max_ctry_comp = size(DB.y_cut, 2); % 21
    max_ctrgp_comp = vsc.deg_step;

    % init temp storage
    ircorr_mat = zeros(size(abfil_fpspec_simdata, 1) + size(irmodel, 1) - 1,...
    size(abfil_fpspec_simdata, 2) + size(irmodel, 2) - 1);

    % // deg_store = linspace(0, size(DB.deg, 2) - vsc.deg_step, vsc.n_step); % for result reordering
    % // for n_step = 18, [0, 10, 20... 170]

    for ctrx_comp = 1 : max_ctrx_comp
        for ctry_comp = 1 : max_ctry_comp
            for ctrgp_comp = 1 : max_ctrgp_comp
                % // tic;
                ircorr_mat = xcorr2(abfil_fpspec_simdata,...
                    irmodel(:, :, ctrgp_comp, ctrx_comp, ctry_comp));
                % temporarily store the xcorr result for this iteration only
                % // toc;
                
                % store
                ircorr_simdata(:, ctrgp_comp, ctrx_comp, ctry_comp)...
                    = ircorr_mat(size(abfil_fpspec_simdata, 1), vsc.n_step : 2 * vsc.n_step - 1);
            end
        end
    end
% end comparison


% OUTPUT save
    save('.\mat\5IRDB.mat', 'IRDB');
    save('.\mat\5irc_simdata.mat', 'ircorr_simdata');
    % fprintf('IRMETHODp1et2 DONE\n');
% end output save
