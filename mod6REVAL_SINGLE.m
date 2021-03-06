% MODULUS 6REVAL_SINGLE
%   using function func_getRvalue to evaluate the difference between
%   simulation input and result
% DEPENDENCY
%   ACVSG
% FILE OUTPUT
%   ACVSG\IR_REVAL[num].mat


clc;
clear variables;
load('.\ACVSG\ACV19_IR.mat');


% init
    % storage
    reval = struct(...
        'R11', [],...
        'R21', [],...
        'corr1', [],...
        'R12', [],...
        'R22', [],...
        'corr2', [],...
        'idc_mix', 0);
% end init


% process
    % plane_a = [1, 1, 1];
    % plane_b = [1, 1, 1];
    % plane_a_deg = 0;
    % plane_b_deg = 90;
    % [R, phi, tau] = func_getRvalue(plane_a, plane_b, plane_a_deg, plane_b_deg);
    
    % two conditions:
    % without FSMETHOD =>> 1 ir result
    % with FSMETHOD =>> 1 / 2 ir results
    reval.idc_mix = idc_mix;
    
    plane_sim1 = [initg1.x_miller, initg1.y_miller, 1];
    plane_sim1_deg = initg1.deg;
    plane_sim2 = [initg2.x_miller, initg2.y_miller, 1];
    plane_sim2_deg = initg2.deg;

    for ctr_res = 1 : size(val_corr, 1)
        plane_res1 = [val_corr(ctr_res, 1), val_corr(ctr_res, 2), 1];
        plane_res1_deg = val_corr(ctr_res, 3);

        [evalR11, ~, ~] =...
            func_getRvalue(plane_res1, plane_sim1, plane_res1_deg, plane_sim1_deg);
        [evalR21, ~, ~] =...
            func_getRvalue(plane_res1, plane_sim2, plane_res1_deg, plane_sim2_deg);

        % store
        reval.R11(ctr_res) = evalR11;
        reval.R21(ctr_res) = evalR21;
        reval.corr1(ctr_res) = val_corr(ctr_res, 4);
    end
    
    if idx_mix == 2
        for ctr_res = 1 : size(val_corr_g2, 1)
            plane_res2 = [val_corr_g2(ctr_res, 1), val_corr_g2(ctr_res, 2), 1];
            plane_res2_deg = val_corr_g2(ctr_res, 3);

            [evalR12, ~, ~] =...
                func_getRvalue(plane_res2, plane_sim1, plane_res2_deg, plane_sim1_deg);
            [evalR22, ~, ~] =...
                func_getRvalue(plane_res2, plane_sim2, plane_res2_deg, plane_sim2_deg);

            % store
            reval.R12(ctr_res) = evalR12;
            reval.R22(ctr_res) = evalR22;
            reval.corr2(ctr_res) = val_corr_g2(ctr_res, 4);
        end
    end
% end process


% OUTPUT save
    fprintf('ARCHIVING\n');
    str_acv = sprintf('.\\ACVSG\\ACV%d_REVAL.mat', ctr_acv);
    save(str_acv, 'reval');
    % clear all;
    fprintf('IR_REVAL DONE\n\n');
% end output save
