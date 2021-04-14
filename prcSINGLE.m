% MODULUS
%   this script contains the full process of a run


clc;
clear all;


% main
    mod1CONSTANTS_r3
    mod2preSINGLE
    mod2SIGNAL_r3
    mod3FSPEC_r4
    mod5IRMETHODp1et2_t4
    mod5IRMETHODp3_t1
% end main


% OUTPUT save
    fprintf('CLEARING\n');
    clear variables;
    load('.\mat\1CONSTANTS');
    load('.\mat\2cal_simdata.mat');
    load('.\mat\5IRDB.mat');
    load('.\mat\5irc_simresult.mat');
    ctr_acv = 1;
    str_acv = sprintf('.\\ACV\\IR_ACV%d.mat', ctr_acv);
    save(str_acv);
    clear all;
    fprintf('IR_SIM DONE\n\n');
% end output save
