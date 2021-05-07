% MODULUS 6REVAL_SINGLE
%   using function get_R_value to evaluate the difference between
%   simulation input and result
% DEPENDENCY
%   ACVSG
% FILE OUTPUT
%   ACVSG\IR_REVAL[num].mat


clc;
clear variables;
load('.\ACVSG\IR_ACV3.mat');


% plane_a = [1, 1, 1];
% plane_b = [1, 1, 1];
% plane_a_deg = 0;
% plane_b_deg = 90;
% [R, phi, tau] = get_R_value(plane_a, plane_b, plane_a_deg, plane_b_deg);


% init
    plane_sim1 = [initg1.x_miller, initg1.y_miller, 1];
    plane_sim1_deg = initg1.deg;
    plane_sim2 = [initg2.x_miller, initg2.y_miller, 1];
    plane_sim2_deg = initg2.deg;
    % storage
    reval = struct('idc_eff', '',...
        'R11', zeros(1, size(val_corr, 1)),...
        'R21', zeros(1 : size(val_corr, 1)),...
        'corr1', zeros(1 : size(val_corr, 1)),...
        'R12', zeros(1, size(val_corr, 1)),...
        'R22', zeros(1 : size(val_corr, 1)),...
        'corr2', zeros(1 : size(val_corr, 1)));
% end init


% process
    % two conditions:
    % without FSMETHOD =>> 1 ir result
    % with FSMethod =>> 2 ir result
    if ndims(val_corr) == 2
        reval.idc_eff = 'Result 1 effective.';
        for ctr_res = 1 : size(val_corr, 1)
            plane_res1 = [val_corr(ctr_res, 1), val_corr(ctr_res, 2), 1];
            plane_res1_deg = val_corr(ctr_res, 3);

            [evalR11, ~, ~] =...
                get_R_value(plane_res1, plane_sim1, plane_res1_deg, plane_sim1_deg);
            [evalR21, ~, ~] =...
                get_R_value(plane_res1, plane_sim2, plane_res1_deg, plane_sim2_deg);

            % store
            reval.R11(ctr_res) = evalR11;
            reval.R21(ctr_res) = evalR21;
            reval.corr1(ctr_res) = val_corr(ctr_res, 4);
        end
    elseif ndims(val_corr) == 3
        reval.idc_eff = 'Result 1 and 2 effective.';
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
            reval.R11(ctr_res) = evalR11;
            reval.R21(ctr_res) = evalR21;
            reval.corr1(ctr_res) = val_corr(ctr_res, 4, 1);
            reval.R12(ctr_res) = evalR12;
            reval.R22(ctr_res) = evalR22;
            reval.corr2(ctr_res) = val_corr(ctr_res, 4, 2);
        end
    end
% end process


% OUTPUT save
    fprintf('ARCHIVING\n');
    str_acv = sprintf('.\\ACVSG\\IR_REVAL%d.mat', ctr_acv);
    save(str_acv, 'reval');
    % clear all;
    fprintf('IR_REVAL DONE\n\n');
% end output save
