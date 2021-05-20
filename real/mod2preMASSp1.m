% MODULUS 2preMASSp1
%   generate multiple set of grain info
% DEPENDENCY
%   1CONSTANTS.mat
% FILE OUTPUT
%   2pre_mat.mat


% clear variables;
% load('.\mat\1CONSTANTS.mat');


% initial grain state matrix gen
    sz_vecx = size(vec.x, 2);
    sz_vecy = size(vec.y, 2);
    sz_vecdeg = size(vec.deg, 2);
    sz_mat_graintype = sz_vecx * sz_vecy * sz_vecdeg;
    mat_graintype = zeros(3, sz_mat_graintype);
    
    for ctr_vecx = 1 : sz_vecx
        for ctr_vecy = 1 : sz_vecy
            curreg = (((ctr_vecx - 1) * sz_vecy + (ctr_vecy - 1)) * sz_vecdeg + 1) :...
            (((ctr_vecx - 1) * sz_vecy + (ctr_vecy - 1) + 1) * sz_vecdeg);
            mat_graintype(1, curreg) = vec.x(ctr_vecx);
            mat_graintype(2, curreg) = vec.y(ctr_vecy);
            mat_graintype(3, curreg) = vec.deg;
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
