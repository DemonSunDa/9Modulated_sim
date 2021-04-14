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
% load('.\mat\1CONSTANTS.mat');


% OUTPUT save
    save('.\mat\2pre_IN.mat', 'vsc', 'initg1', 'initg2');
    fprintf('pre1MASS DONE\n');
% end output save
