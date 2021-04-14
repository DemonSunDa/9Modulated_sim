% MODULUS
%   this script contains the full process of a run


clc;
clear all;


% main0
    mod1CONSTANTS_r3
    mod2preSINGLE
    mod2SIGNAL_r3
    mod3FSPEC_r4
    mod5IRMETHODp1et2_t4
    mod5IRMETHODp3_t1
% end main


% OUTPUT save
    fprintf('ARCHIVING\n');
    clear variables;
    load('.\ACV\acvmgr.mat');
    load('.\mat\1CONSTANTS.mat', 'SC');
    load('.\mat\2pre_IN.mat');
    load('.\mat\5irc_simresult.mat');
    ctr_acv = ctr_acv + 1;
    str_acv = sprintf('.\\ACV\\IR_ACV%d.mat', ctr_acv);
    save(str_acv);
    save('.\ACV\acvmgr.mat', 'ctr_acv');
    clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save
