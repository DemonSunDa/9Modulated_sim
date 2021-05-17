% MODULUS 2pre1SINGLE
%   generate one set of grain info and variable system config
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
% load('.\mat\1CONSTANTS.mat');


% INPUT initial state
    fprintf('Mode = %d\n', SC.mode);
    fprintf('Wavelength = %.2f um\n', SC.lambda * 1e6);
    fprintf('Distance from centre of generation patch to detection beam = %.2f um\n', SC.d_gc2d * 1e6);
    
    vsc.noise_level = 0; % input('Noise level (in percentage) = ') / 100;
    
    vsc.n_fringe = 12; % input('Fringe number = '); % when 10
    vsc.patch = SC.lambda * vsc.n_fringe; % equal to 200e-6
    
    vsc.n_step = 18; % input('Number of rotation steps = ');
    vsc.deg_step = 180 / vsc.n_step;
    
    initg1.prop = input('Grain 1 proportion (in percentage) = ') / 100;
    initg2.prop = 1 - initg1.prop;
    initg1.d_2d = SC.d_gc2d - initg2.prop * vsc.patch / 2; % distance from centre of g1 to detection beam
    initg2.d_2d = SC.d_gc2d + initg1.prop * vsc.patch / 2; % distance from centre of g2 to detection beam
    
    fprintf('INPUT GRAIN1 ORIENTATION\n');
    fprintf('(the grain closer to detection beam)\n');
    % [initg1.x_miller, initg1.y_miller, initg1.deg] = func_gparamsIN();
    initg1.x_miller = 0;
    initg1.y_miller = 0;
    initg1.deg = 0;
    fprintf('INPUT GRAIN2 ORIENTATION\n');
    % [initg2.x_miller, initg2.y_miller, initg2.deg] = func_gparamsIN();
    initg2.x_miller = 1;
    initg2.y_miller = 1;
    initg2.deg = 0;
% end input initial state


% OUTPUT save
    % save('.\mat\2pre_IN.mat', 'vsc', 'initg1', 'initg2');
    % fprintf('preSINGLE DONE\n');
% end output save
