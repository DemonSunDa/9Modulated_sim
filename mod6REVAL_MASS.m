% MODULUS 6REVAL_MASS
%   using function get_R_value to evaluate the difference between
%   simulation input and result
% DEPENDENCY
%   ACVMS
% FILE OUTPUT
%   ACVMS\IR_REVAL[num].mat


% clc;
% clear variables;
% load('.\ACVMS\IR_ACV25.mat');

% init
    % storage
    reval(1 : sz_simresult(1), 1 : sz_simresult(2),...
        1 : sz_simresult(3), 1 : sz_simresult(4),...
        1 : sz_simresult(5), 1 : sz_simresult(6))...
        = struct('idc_eff', '',...
        'R11', [],...
        'R21', [],...
        'corr1', [],...
        'R12', [],...
        'R22', [],...
        'corr2', []);
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
    if ndims(stArr_simresult(1,1,1,1,1,1).val_corr) == 2
        for ctr_d5 = 1 : sz_simresult(6)
        for ctr_d4e = 1 : sz_simresult(5)
        for ctr_d4 = 1 : sz_simresult(4)
        for ctr_d3 = 1 : sz_simresult(3)
        for ctr_d2e = 1 : sz_simresult(2)
        for ctr_d2 = 1 : sz_simresult(1)
        for ctr_res = 1 : size(stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr, 1)
            reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).idc_eff = 'Result 1 effective.';
            
            plane_sim1 = [stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg1.x_miller,...
            stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg1.y_miller, 1];
            plane_sim1_deg = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg1.deg;
            plane_sim2 = [stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg2.x_miller,...
            stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg2.y_miller, 1];
            plane_sim2_deg = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg2.deg;
            
            plane_res1 = [stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 1), stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 2), 1];
            plane_res1_deg = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 3);

            [evalR11, ~, ~] =...
                get_R_value(plane_res1, plane_sim1, plane_res1_deg, plane_sim1_deg);
            [evalR21, ~, ~] =...
                get_R_value(plane_res1, plane_sim2, plane_res1_deg, plane_sim2_deg);

            % store
            reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).R11(ctr_res) = evalR11;
            reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).R21(ctr_res) = evalR21;
            reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).corr1(ctr_res) = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 4);
        end % end res
        end % end d2
        end % end d2e
        end % end d3
        end % end d4
        end % end d4e
        end % end d5
    elseif ndims(stArr_simresult(1,1,1,1,1,1).val_corr) == 3
%         for ctr_res = 1 : size(val_corr, 1)
%             plane_res1 = [val_corr(ctr_res, 1, 1), val_corr(ctr_res, 2, 1), 1];
%             plane_res1_deg = val_corr(ctr_res, 3, 1);
%             plane_res2 = [val_corr(ctr_res, 1, 2), val_corr(ctr_res, 2, 2), 1];
%             plane_res2_deg = val_corr(ctr_res, 3, 2);
% 
%             [evalR11, ~, ~] =...
%                 get_R_value(plane_res1, plane_sim1, plane_res1_deg, plane_sim1_deg);
%             [evalR21, ~, ~] =...
%                 get_R_value(plane_res1, plane_sim2, plane_res1_deg, plane_sim2_deg);
%             [evalR12, ~, ~] =...
%                 get_R_value(plane_res2, plane_sim1, plane_res2_deg, plane_sim1_deg);
%             [evalR22, ~, ~] =...
%                 get_R_value(plane_res2, plane_sim2, plane_res2_deg, plane_sim2_deg);
% 
%             % store
%             reval(ctr_res).R11 = evalR11;
%             reval(ctr_res).R21 = evalR21;
%             reval(ctr_res).corr1 = val_corr(ctr_res, 4, 1);
%             reval(ctr_res).R12 = evalR12;
%             reval(ctr_res).R22 = evalR22;
%             reval(ctr_res).corr2 = val_corr(ctr_res, 4, 2);
%         end
    end
% end process


% OUTPUT save
    % fprintf('ARCHIVING\n');
    % str_acv = sprintf('.\\ACVMS\\IR_ACV%d.mat', ctr_acv);
    % save(str_acv, 'reval');
    % clear all;
    % fprintf('IR_REVAL DONE\n\n');
% end output save
