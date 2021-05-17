clc;
clear variables;

load('.\ACVMS\ACV46_IR.mat');
stArr_simresult1 = stArr_simresult;
load('.\ACVMS\ACV47_IR.mat');
stArr_simresult2 = stArr_simresult;
load('.\ACVMS\ACV48_IR.mat');
stArr_simresult3 = stArr_simresult;

stArr_simresult = cat(6, stArr_simresult1, stArr_simresult2, stArr_simresult3);
ctr_acv = '46-48';
sel.noise = 1 : 11;
sz_simresult = size(stArr_simresult);

save('.\ACVMS\ACV46-48.mat', 'ctr_acv', 'SC', 'sel', 'stArr_simresult', 'sz_simresult', 'vec');