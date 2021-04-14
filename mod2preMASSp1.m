% MODULUS 2pre2MASS
%   generate multiple set of grain info and variable system config
%   by MANUAL INPUT
% DEPENDENCY
%   1CONSTANTS.mat
% PROMPTED INPUT
%   noise level
%   fringe number (with fixed wavelength)
%   numberof rotation steps
%   grain proportion
%   orientations
% FILE OUTPUT
%   2pre_IN.mat


% clear variables;
% fprintf('2preSINGLE\nLOADING\n');
load('.\mat\1CONSTANTS.mat');


% initial grain state matrix gen
    vec_x = linspace(1, size(DB.x_cut, 2), 6) + 0; % for vec size 21, 11, 6 etc
    vec_y = linspace(1, size(DB.y_cut, 2), 6) + 0;
    vec_deg = linspace(10 , size(DB.deg, 2), 18) - 0;
    for ctr_vecx = 1 : size(vec_x, 2)
        for ctr_vecy = 1 : size(vec_y, 2)
            mat_graintype = ;
        end
    end
% end initial grain state matrix gen


% OUTPUT save
    fprintf('SAVING\n');
    save('.\mat\2pre_mat.mat', '');
    fprintf('preMASSp1 DONE\n');
% end output save
