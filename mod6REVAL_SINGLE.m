% MODULUS 6REVAL_SINGLE
%   using function get_R_value to evaluate the difference between
%   simulation input and result
% DEPENDENCY
%   ACVSG
% FILE OUTPUT
%   ACVSG\IR_REP[num].mat


clc;
clear variables;
% load('.\ACVSG\IR_ACV10.mat');


plane_a = [1, 1, 1];
plane_b = [1, 1, 1];
plane_a_deg = 0;
plane_b_deg = 90;
[R, phi, tau] = get_R_value(plane_a, plane_b, plane_a_deg, plane_b_deg);


% sz_simresult = size(stArr_simresult);
% plane_sim = [stArr_simresult(1,1,11,11,4).initg1.x_miller, stArr_simresult(1,1,11,11,4).initg1.y_miller, 1];
% plane_sim_deg = stArr_simresult(1,1,11,11,4).initg1.deg;
% plane_res = [stArr_simresult(1,1,11,11,4).val_corr(1, 1), stArr_simresult(1,1,11,11,4).val_corr(1, 2), 1];
% plane_res_deg = stArr_simresult(1,1,11,11,4).val_corr(1, 3);
% [eval_R, eval_phi, eval_tau] = get_R_value(plane_res, plane_sim, plane_res_deg, plane_sim_deg);
