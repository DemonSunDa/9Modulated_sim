clc;
clear variables;
load('.\ACVMS\ACV42_IR.mat');

matMeanSNR = zeros(sz_simresult(3), sz_simresult(6));
matStdSNR = zeros(sz_simresult(3), sz_simresult(6));

for ctr_noise = 1 : sz_simresult(6)
    for ctr_prop = 1 : sz_simresult(3)
        matMeanSNR(ctr_prop, ctr_noise) = mean(stArr_simresult(4,1,ctr_prop,1,1,ctr_noise).snr_simdata);
        matStdSNR(ctr_prop, ctr_noise) = std(stArr_simresult(4,1,ctr_prop,1,1,ctr_noise).snr_simdata);
    end
end

figure(324);
   imagesc([0.01, 0.015], [0, 1], matMeanSNR);
   xlabel('noise level');
   ylabel('grain 1 proportion');
   colorbar;
