


clc;
clear variables;
load('.\ACVMS\IR_ACV10.mat');


sz_simresult = size(stArr_simresult);
plane_sim = [stArr_simresult(1,1,11,11,4).initg1.x_miller, stArr_simresult(1,1,11,11,4).initg1.y_miller, 1];
plane_sim_deg = stArr_simresult(1,1,11,11,4).initg1.deg;
plane_res = [stArr_simresult(1,1,11,11,4).val_corr(1, 1), stArr_simresult(1,1,11,11,4).val_corr(1, 2), 1];
plane_res_deg = stArr_simresult(1,1,11,11,4).val_corr(1, 3);
[eval_R, eval_phi, eval_tau] = get_R_value(plane_res, plane_sim, plane_res_deg, plane_sim_deg);
