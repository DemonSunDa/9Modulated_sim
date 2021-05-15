% mod1CONSTANTS_r3
% mod2preSINGLE
% mod2SIGNAL_r3
% mod3FSPEC_r4
% sigplot1 = signal_simdata(:, 1);
% fpspecplot1 = fpspec_simdata;
% snr1 = snr_simdata;
% mean_snr1 = mean(snr1);
% std_snr1 = std(snr1);
% 
% 
% mod2preSINGLE
% mod2SIGNAL_r3
% mod3FSPEC_r4
% sigplot2 = signal_simdata(:, 1);
% fpspecplot2 = fpspec_simdata;
% snr2 = snr_simdata;
% mean_snr2 = mean(snr2);
% std_snr2 = std(snr2);


% waveC = sin(linspace(0, 80*pi, 10000));
% waveM = gaussmf(linspace(0, 80*pi, 10000), [4*pi, 40*pi]);

waveS = simg1temp.signal + simg2temp.signal;
waveN = whitenoise;

figure(3181);
    subplot(2,1,1);
    plot(time_sig, waveS);
    xlabel('time (s)');
    ylabel('normalised amplitude');
    % axis off;
    
    subplot(2,1,2);
    plot(time_sig, waveN);
    xlabel('time (s)');
    ylabel('normalised amplitude');
    % axis off;
    
figure(3182);
    plot(time_sig, SAW_simtemp);
    xlabel('time (s)');
    ylabel('normalised amplitude');
    % axis off;


% figure(1);
%     subplot(2,1,1);
%     plot(time_sig, sigplot1);
%     title('(c)');
%     xlabel('time (s)');
%     ylabel('normalised amplitude');
%     
%     subplot(2,1,2);
%     plot(time_sig, sigplot2);
%     title('(d)');
%     xlabel('time (s)');
%     ylabel('normalised amplitude');
%     
% figure(2);
%     subplot(2,1,1);
%     plot(fp_ft, fpspecplot1(:, 1));
%     title('(c)');
%     xlabel('frequency (Hz)');
%     ylabel('normalised amplitude');
%     
%     subplot(2,1,2);
%     plot(fp_ft, fpspecplot2(:, 1));
%     title('(d)');
%     xlabel('frequency (Hz)');
%     ylabel('normalised amplitude');
% 
% fmat_range = [0 4000]; % frequency matrix range
% [f_scale, raw_polar] = rawdata2polarplot(fpspecplot1, fmat_range);
% figure(3);
%     imagesc(f_scale, f_scale, raw_polar);
%     title('(c)');
%     axis image;
%     
% [f_scale, raw_polar] = rawdata2polarplot(fpspecplot2, fmat_range);
% figure(4);
%     imagesc(f_scale, f_scale, raw_polar);
%     title('(d)');
%     axis image;