% MODULUS 1CONSTANTS
%   generate constants including databse info and system config
% DEPENDENCY
%   0Ni_super_001_to_110_to_111_step_0.05.mat
% FILE OUTPUT
%   1CONSTANTS.mat


% clear variables;
% fprintf('1CONSTANTS\nLOADING\n');
load('.\mat\0Ni_super_001_to_110_to_111_step_0.05.mat'); % include database


% simulation configurations
    SC.mode = 1;
    SC.lambda = 23.8e-6; % fixed wavelength
    SC.d_gc2d = 140e-6; % distance from generation patch centre to detection beam
% end simulation configurations
    

% database infomations
    DB.deg = deg;
    DB.pla = pla;
    DB.sv = sv;
    DB.sv_m = sv_m;
    DB.x_cut = x_cut;
    DB.y_cut = y_cut;

    DB.v_min = min(sv_m(:,:,:,1),[],'all') * 1e3; % max & min v in database
    DB.v_max = max(sv_m(:,:,:,1),[],'all') * 1e3;

    DB.f_centre = (DB.v_max + DB.v_min) / (2 * SC.lambda); % the middle of possible f
    DB.f_diffmax = (DB.v_max - DB.v_min) / SC.lambda; % diference between min and max f
% end database infomations
    
% OUTPUT save
    % save('.\mat\1CONSTANTS.mat', 'DB', 'SC');
    % fprintf('CONSTANTS DONE\n');
% end output save
