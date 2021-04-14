% MODULUS
%   this script contains the full process of a run


clc;
clear all;


% main
    mod1CONSTANTS_r3
    mod2preSINGLE
    fprintf('PROCESSING 1\n');
    mod2SIGNAL_r3
    mod3FSPEC_r4
    mod5IRMETHODp1et2_t4
    mod5IRMETHODp3_t1
% end main


% OUTPUT save
    fprintf('ARCHIVING\n');
    clear variables;
    load('.\ACVSG\acvmgr.mat');
    load('.\mat\1CONSTANTS.mat', 'SC');
    load('.\mat\2pre_IN.mat');
    load('.\mat\5irc_simresult.mat', 'val_corr');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACVSG\\IR_ACV%d.mat', ctr_acv);
    save(str_acv, 'ctr_acv', 'SC', 'initg1', 'initg2', 'val_corr', 'vsc');
    save('.\ACVSG\acvmgr.mat', 'ctr_acv');
    clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save
