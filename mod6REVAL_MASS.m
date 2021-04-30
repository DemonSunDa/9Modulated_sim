% MODULUS 6REVAL_MASS
%   using function get_R_value to evaluate the difference between
%   simulation input and result
% DEPENDENCY
%   ACVMS
% FILE OUTPUT
%   ACVMS\IR_REP[num].mat


clc;
clear variables;
load('.\ACVMS\IR_ACV10.mat');

% init
    sz_simresult = size(stArr_simresult);
    % storage
    reval(1 : size(val_corr, 1)) = struct('idc_eff', '',...
        'R11', 0, 'R21', 0, 'corr1', 0,...
        'R12', 0, 'R22', 0, 'corr2', 0);
% end init


% process
    % two conditions:
    % without FSMETHOD =>> 1 ir result
    % with FSMethod =>> 2 ir result
    % plane_sim = [stArr_simresult(1,1,11,11,4).initg1.x_miller, stArr_simresult(1,1,11,11,4).initg1.y_miller, 1];
    % plane_sim_deg = stArr_simresult(1,1,11,11,4).initg1.deg;
    % plane_res = [stArr_simresult(1,1,11,11,4).val_corr(1, 1), stArr_simresult(1,1,11,11,4).val_corr(1, 2), 1];
    % plane_res_deg = stArr_simresult(1,1,11,11,4).val_corr(1, 3);
    % [eval_R, eval_phi, eval_tau] = get_R_value(plane_res, plane_sim, plane_res_deg, plane_sim_deg);
    if ndims(val_corr) == 2
        for ctr_res = 1 : size(val_corr, 1)
            plane_res1 = [val_corr(ctr_res, 1), val_corr(ctr_res, 2), 1];
            plane_res1_deg = val_corr(ctr_res, 3);

            [evalR11, ~, ~] =...
                get_R_value(plane_res1, plane_sim1, plane_res1_deg, plane_sim1_deg);
            [evalR21, ~, ~] =...
                get_R_value(plane_res1, plane_sim2, plane_res1_deg, plane_sim2_deg);

            % store
            reval(ctr_res).R11 = evalR11;
            reval(ctr_res).R21 = evalR21;
            reval(ctr_res).corr1 = val_corr(ctr_res, 4);
        end
    elseif ndims(val_corr) == 3
        for ctr_res = 1 : size(val_corr, 1)
            plane_res1 = [val_corr(ctr_res, 1, 1), val_corr(ctr_res, 2, 1), 1];
            plane_res1_deg = val_corr(ctr_res, 3, 1);
            plane_res2 = [val_corr(ctr_res, 1, 2), val_corr(ctr_res, 2, 2), 1];
            plane_res2_deg = val_corr(ctr_res, 3, 2);

            [evalR11, ~, ~] =...
                get_R_value(plane_res1, plane_sim1, plane_res1_deg, plane_sim1_deg);
            [evalR21, ~, ~] =...
                get_R_value(plane_res1, plane_sim2, plane_res1_deg, plane_sim2_deg);
            [evalR12, ~, ~] =...
                get_R_value(plane_res2, plane_sim1, plane_res2_deg, plane_sim1_deg);
            [evalR22, ~, ~] =...
                get_R_value(plane_res2, plane_sim2, plane_res2_deg, plane_sim2_deg);

            % store
            reval(ctr_res).R11 = evalR11;
            reval(ctr_res).R21 = evalR21;
            reval(ctr_res).corr1 = val_corr(ctr_res, 4, 1);
            reval(ctr_res).R12 = evalR12;
            reval(ctr_res).R22 = evalR22;
            reval(ctr_res).corr2 = val_corr(ctr_res, 4, 2);
        end
    end
% end process
