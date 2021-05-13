clc;
clear variables;
load('sig_noise.mat');


snr_real = zeros(1, 101);


for ctr = 1 : 101
    snr_real(ctr) = snr(w_signal(ctr,:), w_noise);
end

mean_snr_real = mean(snr_real);