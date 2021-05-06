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
    vsc.noise_level = noise_level;
    vsc.n_fringe = n_fringe;
    vsc.patch = SC.lambda * vsc.n_fringe;
    vsc.n_step = n_step;
    vsc.deg_step = 180 / vsc.n_step;

    initg1.prop = g1_prop;
    initg2.prop = 1 - g1_prop;
    initg1.d_2d = SC.d_gc2d - initg2.prop * vsc.patch / 2;
    initg2.d_2d = SC.d_gc2d + initg1.prop * vsc.patch / 2;
    
    initg1.x_miller = mat_graintype(1, ctr_d2);
    initg1.y_miller = mat_graintype(2, ctr_d2);
    initg1.deg = mat_graintype(3, ctr_d2);
    initg2.x_miller = mat_graintype(1, ctr_d2e);
    initg2.y_miller = mat_graintype(2, ctr_d2e);
    initg2.deg = mat_graintype(3, ctr_d2e);
% end gen


% OUTPUT save
    % save('.\mat\2pre_IN.mat', 'vsc', 'initg1', 'initg2');
    % fprintf('pre1MASS DONE\n');
% end output save
