% MODULUS 2pre2MASS
%   generate multiple set of grain info
%   by MANUAL INPUT
% DEPENDENCY
%   1CONSTANTS.mat
% FILE OUTPUT
%   2pre_mat.mat


% clear variables;
% load('.\mat\1CONSTANTS.mat');


% initial grain state matrix gen
    sz_vecx = 1;
    sz_vecy = 1;
    sz_vecdeg = 1;
    sz_mat_graintype = sz_vecx * sz_vecy * sz_vecdeg;
    mat_graintype = zeros(3, sz_mat_graintype);
    % vec_x = linspace(DB.x_cut(1) , DB.x_cut(size(DB.x_cut, 2)), sz_vecx) + 0; % for vec size 21, 11, 6, 3 etc
    % vec_y = linspace(DB.y_cut(1) , DB.y_cut(size(DB.y_cut, 2)), sz_vecy) + 0;
    % vec_deg = linspace(10, 180, sz_vecdeg) - 0;
    vec_x = [1];
    vec_y = [0.3];
    vec_deg = [10];
    for ctr_vecx = 1 : sz_vecx
        for ctr_vecy = 1 : sz_vecy
            curreg = (((ctr_vecx - 1) * sz_vecy + (ctr_vecy - 1)) * sz_vecdeg + 1) :...
            (((ctr_vecx - 1) * sz_vecy + (ctr_vecy - 1) + 1) * sz_vecdeg);
            mat_graintype(1, curreg) = vec_x(ctr_vecx);
            mat_graintype(2, curreg) = vec_y(ctr_vecy);
            mat_graintype(3, curreg) = vec_deg;
            % ln 1 for x
            % ln 2 for y
            % ln 3 for deg
        end
    end
% end initial grain state matrix gen


% OUTPUT save
    % save('.\mat\2pre_mat.mat', 'mat_graintype', 'sz_mat_graintype');
    % fprintf('preMASSp1 DONE\n');
% end output save
