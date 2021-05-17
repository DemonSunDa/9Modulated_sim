clc;
clear variables;

load('.\ACVMS\ACV43_IR.mat');
stArr_simresult1 = stArr_simresult;
load('.\ACVMS\ACV44_IR.mat');
stArr_simresult2 = stArr_simresult;
load('.\ACVMS\ACV45_IR.mat');
stArr_simresult3 = stArr_simresult;

stArr_simresult = cat(6, stArr_simresult1, stArr_simresult2, stArr_simresult3);
ctr_acv = [43, 44, 45];
sel.noise = 1 : 11;
sz_simresult = size(stArr_simresult);

save('.\ACVMS\ACV43-45.mat', 'ctr_acv', 'SC', 'sel', 'stArr_simresult', 'sz_simresult', 'vec');