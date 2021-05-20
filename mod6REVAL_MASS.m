% MODULUS 6REVAL_MASS
%   using function func_getRvalue to evaluate the difference between
%   simulation input and result
% DEPENDENCY
%   ACVMS
% FILE OUTPUT
%   ACVMS\IR_REVAL[num].mat


clc;
clear variables;
% load('.\ACVMS\storage\ACV46_IR.mat');

ctr_acv = '58';
str_acv = sprintf('.\\ACVMS\\ACV%s.mat', ctr_acv);
load(str_acv);

% init
    % storage
        reval(1 : sz_simresult(1), 1 : sz_simresult(2),...
            1 : sz_simresult(3), 1 : sz_simresult(4),...
            1 : sz_simresult(5), 1 : sz_simresult(6))...
            = struct(...
            'R11', [],...
            'R21', [],...
            'corr1', [],...
            'R12', [],...
            'R22', [],...
            'corr2', [],...
            'idc_mix', 0);
        SNR.matMean = zeros(sz_simresult(3), sz_simresult(4), sz_simresult(5), sz_simresult(6));
        SNR.matStd = zeros(sz_simresult(3), sz_simresult(4), sz_simresult(5), sz_simresult(6));
% end init


% process
    % two conditions:
    % without FSMETHOD =>> 1 ir result
    % with FSMETHOD =>> 1 / 2 ir results
    for ctr_d5 = 1 : sz_simresult(6)
    for ctr_d4e = 1 : sz_simresult(5)
    for ctr_d4 = 1 : sz_simresult(4)
    for ctr_d3 = 1 : sz_simresult(3)
    for ctr_d2e = 1 : sz_simresult(2)
    for ctr_d2 = 1 : sz_simresult(1)
        reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).idc_mix...
            = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).idc_mix;
        
        plane_sim1 = [stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg1.x_miller,...
            stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg1.y_miller, 1];
        plane_sim1_deg = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg1.deg;
        plane_sim2 = [stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg2.x_miller,...
            stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg2.y_miller, 1];
        plane_sim2_deg = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).initg2.deg;
        
        for ctr_res = 1 : size(stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr, 1)
            plane_res1 = [stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 1),...
                stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 2), 1];
            plane_res1_deg = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 3);

            evalR11 = func_unsymRvalue(plane_res1(1), plane_res1(2), plane_res1_deg,...
                plane_sim1(1), plane_sim1(2), plane_sim1_deg);
            evalR21 = func_unsymRvalue(plane_res1(1), plane_res1(2), plane_res1_deg,...
                plane_sim2(1), plane_sim2(2), plane_sim2_deg);
            
%             [evalR11, ~, ~] =...
%                 func_getRvalue(plane_res1, plane_sim1, plane_res1_deg, plane_sim1_deg);
%             [evalR21, ~, ~] =...
%                 func_getRvalue(plane_res1, plane_sim2, plane_res1_deg, plane_sim2_deg);

            % store
            reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).R11(ctr_res) = evalR11;
            reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).R21(ctr_res) = evalR21;
            reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).corr1(ctr_res)...
                = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr(ctr_res, 4);
        end

        if stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).idc_mix == 2
            for ctr_res = 1 : size(stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr_g2, 1)
                plane_res2 = [stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr_g2(ctr_res, 1),...
                    stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr_g2(ctr_res, 2), 1];
                plane_res2_deg = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr_g2(ctr_res, 3);
                
                evalR12 = func_unsymRvalue(plane_res2(1), plane_res2(2), plane_res2_deg,...
                    plane_sim1(1), plane_sim1(2), plane_sim1_deg);
                evalR22 = func_unsymRvalue(plane_res2(1), plane_res2(2), plane_res2_deg,...
                    plane_sim2(1), plane_sim2(2), plane_sim2_deg);
                
%                 [evalR12, ~, ~] =...
%                     func_getRvalue(plane_res2, plane_sim1, plane_res2_deg, plane_sim1_deg);
%                 [evalR22, ~, ~] =...
%                     func_getRvalue(plane_res2, plane_sim2, plane_res2_deg, plane_sim2_deg);
    
                % store
                reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).R12(ctr_res) = evalR12;
                reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).R22(ctr_res) = evalR22;
                reval(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).corr2(ctr_res)...
                    = stArr_simresult(ctr_d2, ctr_d2e, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).val_corr_g2(ctr_res, 4);
            end
        end
    end % d2
    end % d2e
    SNRcat= [];
    for ctr_g2 = 1 : sz_simresult(2)
        for ctr_g1 = 1 : sz_simresult(1)
            SNRcat =cat(2, SNRcat,...
                stArr_simresult(ctr_g1, ctr_g2, ctr_d3, ctr_d4, ctr_d4e, ctr_d5).snr_simdata);
        end
    end
    SNR.matMean(ctr_d3, ctr_d4, ctr_d4e, ctr_d5) = mean(SNRcat);
    SNR.matStd(ctr_d3, ctr_d4, ctr_d4e, ctr_d5) = std(SNRcat);
    end % d3
    end % d4
    end % d4e
    end % d5
% end process


% OUTPUT save
    fprintf('ARCHIVING\n');
    str_acv = sprintf('.\\ACVMS\\ACV%s_REVAL.mat', ctr_acv);
    save(str_acv, 'reval', 'SNR');
    % save('.\ACVMS\ACV50_REVAL.mat', 'reval', 'SNR');
    % clear all;
    fprintf('IR_REVAL DONE\n\n');
% end output save
