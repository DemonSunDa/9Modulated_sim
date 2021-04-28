% [R_value, ang_phi, ang_tau]=get_R_value(plane_a,plane_b,plane_a_rotate_degree,plane_b_rotate_degree)
% e.g plane_a = [0 0 1], plane_b = [0.8 0.1 1], 
% Calculate the R-value (REL, or R-2cos) (misorientation or disorientation) between plane A
% and plane B. All the outputs are in degree.
% vector points to eyes,anti clockwise is positive
% plane a rotates to plane b position, so plane b is the reference

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


function  [rotatin_matrix,new_direction]=get_rotation_matrix(plane)

    h=plane(1);
    k=plane(2);
    l=plane(3);
    
     hkl=[h k l];
     if l==0 && k==0
        hkldash=hkl;%/norm(hkl);
     else
        hkldash=hkl/norm(hkl);
     end
    
    %hkldash=hkldash.';
    rotaxis=cross([0 0 1],hkldash);
    
     if k==0 && h==0
         rotaxis=rotaxis;
     else
         rotaxis=rotaxis/norm(rotaxis);
     end
    
    % so we have define and axis for rotation
    %rotaxis=rotaxis.';
    % now to get cosine and sine of rotation
    sth=norm(cross([0 0 1],hkldash));
    
    cth=norm(dot([0 0 1],hkldash));
    % this gives rotation angle
    % these give the angles we that we need to rotate. so we now have
    % the axis we need to rotate about and the angle about this axis.
    
    rotmat=zeros(3,3);
    vth=1-cth;
    ux=rotaxis(1);
    uy=rotaxis(2);
    uz=rotaxis(3);
    
    rotmat(1,1)=(ux*ux*vth)+cth;
    rotmat(2,1)=(uy*ux*vth)+(uz*sth);
    rotmat(3,1)=(uz*ux*vth)-(uy*sth);
    rotmat(1,2)=(uy*ux*vth)-(uz*sth);
    rotmat(2,2)=(uy*uy*vth)+cth;
    rotmat(3,2)=(uz*uy*vth)+(ux*sth);
    rotmat(1,3)=(ux*uz*vth)+(uy*sth);
    rotmat(2,3)=(uz*uy*vth)-(ux*sth);
    rotmat(3,3)=(uz*uz*vth)+cth;
    rotatin_matrix=rotmat;%.';%transpose because we are transforming coords not rotating in same coords

    dir=[1 0 0];
    % for i=1:3
    %     temp=0;
    %     tempb=0;
    %     for j=1:3
    %                     temp=rotmat(i,j)*dir(j);
    %                     tempb=temp+tempb;
    %     end
    %     new_direction(i)=tempb;
    % end
    new_direction=dir*rotmat.';
end


function  [rotatin_matrix_from_arbitrary_plane,new_direction_from_arbitrary_plane]=get_rotation_matrix_from_arbitrary_plane(plane,reference_plane)

    h=plane(1);
    k=plane(2);
    l=plane(3);
    
    hkl=[h k l];
    if l==0 && k==0
        hkldash=hkl;%/norm(hkl);
    else
        hkldash=hkl/norm(hkl);
    end
    
    %hkldash=hkldash.';
    rotaxis=cross(reference_plane,hkldash);
    
    if k==0 && h==0
        rotaxis=rotaxis;
    else
        rotaxis=rotaxis/norm(rotaxis);
    end
    
        % so we have define and axis for rotation
    %rotaxis=rotaxis.';
    % now to get cosine and sine of rotation
    sth=norm(cross(reference_plane,hkldash));
    
    cth=norm(dot(reference_plane,hkldash));
    % this gives rotation angle
    % these give the angles we that we need to rotate. so we now have
    % the axis we need to rotate about and the angle about this axis.
    
    rotmat=zeros(3,3);
    vth=1-cth;
    ux=rotaxis(1);
    uy=rotaxis(2);
    uz=rotaxis(3);
    
    rotmat(1,1)=(ux*ux*vth)+cth;
    rotmat(2,1)=(uy*ux*vth)+(uz*sth);
    rotmat(3,1)=(uz*ux*vth)-(uy*sth);
    rotmat(1,2)=(uy*ux*vth)-(uz*sth);
    rotmat(2,2)=(uy*uy*vth)+cth;
    rotmat(3,2)=(uz*uy*vth)+(ux*sth);
    rotmat(1,3)=(ux*uz*vth)+(uy*sth);
    rotmat(2,3)=(uz*uy*vth)-(ux*sth);
    rotmat(3,3)=(uz*uz*vth)+cth;
    rotatin_matrix_from_arbitrary_plane=rotmat;%.';%transpose because we are transforming coords not rotating in same coords
    
    [rotation_matrix_from_001, dir_from_001]=get_rotation_matrix(reference_plane);
    % for i=1:3
    %     temp=0;
    %     tempb=0;
    %     for j=1:3
    %                     temp=rotmat(i,j)*dir_from_001(j);
    %                     tempb=temp+tempb;
    %     end
    %     new_direction_from_arbitrary_plane(i)=tempb;
    % end
    new_direction_from_arbitrary_plane=dir_from_001*rotmat.';

end
