% MODULUS
%   this script contains the full process of a run for IR


clc;
clear all;


% main
    mod1CONSTANTS_r3
    mod2preSINGLE
    fprintf('PROCESSING 1\n');
    mod2SIGNAL_r3
    mod3FSPEC_r4
    mod4et5preFILTER
    mod5IRMETHODp1et2_t4
    mod5IRMETHODp3_t1
% end main


% OUTPUT save
    fprintf('ARCHIVING\n');
    load('.\ACVSG\acvmgr.mat');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACVSG\\IR_ACV%d.mat', ctr_acv);
    save(str_acv, 'ctr_acv', 'SC', 'initg1', 'initg2', 'val_corr', 'vsc');
    save('.\ACVSG\acvmgr.mat', 'ctr_acv');
    % clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save
