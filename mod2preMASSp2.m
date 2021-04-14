% MODULUS 2pre2MASS
%   using pre generated info to produce one set of config
%   by MANUAL INPUT
% DEPENDENCY
%   1CONSTANTS.mat
%   2pre_mat.mat
% FILE OUTPUT
%   2pre_IN.mat


% clear variables;
% load('.\mat\1CONSTANTS.mat');
% load('.\mat\2pre_mat.mat');


% gen
        initg1.prop = 
        initg1.d_2d
        initg1.x_miller
        initg1.y_miller
        initg1.deg
        initg2
        vsc
% end gen


% OUTPUT save
    save('.\mat\2pre_IN.mat', 'vsc', 'initg1', 'initg2');
    fprintf('pre1MASS DONE\n');
% end output save
