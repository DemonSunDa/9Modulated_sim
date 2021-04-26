clc;
clear variables;
load('.\ACVMS\IR_ACV10.mat');


sz = size(stArr_simresult);
plane_sim = [stArr_simresult(1,1,11,11,4).initg1.x_miller, stArr_simresult(1,1,11,11,4).initg1.y_miller, 0];
plane_sim_deg = stArr_simresult(1,1,11,11,4).initg1.deg;
plane_res = [stArr_simresult(1,1,11,11,4).val_corr(1, 1), stArr_simresult(1,1,11,11,4).val_corr(1, 2), 0];
plane_res_deg = stArr_simresult(1,1,11,11,4).val_corr(1, 3);
[eval_R, eval_phi, eval_tau] = get_R_value(plane_res, plane_sim, plane_res_deg, plane_sim_deg);


function  [R_value, ang_phi, ang_tau]=get_R_value(plane_a, plane_b,plane_a_rotate_degree,plane_b_rotate_degree)%,crystal_type)
 
    %%%%%%%%%%% for family planes
    %%%%%% original, for both crystal_type
    Normal_a=abs(plane_a/norm(plane_a));
    Normal_b=abs(plane_b/norm(plane_b)).';
    if round(Normal_b*1e3) == round(Normal_a*1e3)
        ang_phi = 0;
        ang_tau = abs(plane_a_rotate_degree-plane_b_rotate_degree);
        R_value = acos(cos(ang_phi*pi/180)*cos(ang_tau*pi/180))*180/pi;
    else
        [Rot_mat_a,Dire_a]=get_rotation_matrix(Normal_a);
        [Rot_mat_b,Dire_b]=get_rotation_matrix(Normal_b);
        [Rot_mat_b_from_arbitrary_plane,Dire_a_new]=get_rotation_matrix_from_arbitrary_plane(Normal_b,Normal_a);

        ang_phi=atan2(norm(cross(Normal_a,Normal_b)),dot(Normal_a,Normal_b))*180/pi;
        ang_tau=atan2(norm(cross(Dire_b,Dire_a_new)),dot(Dire_b,Dire_a_new))*180/pi+(plane_a_rotate_degree-plane_b_rotate_degree);
        R_value=acos(cos(ang_phi*pi/180)*cos(ang_tau*pi/180))*180/pi;

        ang_phi=round(ang_phi*100)/100;
        ang_tau=round(ang_tau*100)/100;
        R_value=round(R_value*100)/100;
    end
end
