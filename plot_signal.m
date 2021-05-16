% mod1CONSTANTS_r3
% 
% mod2preSINGLE
% mod2SIGNAL_r3
% mod3FSPEC_r4
% mod4et5preFILTER
sigplot1 = signal_simdata(:, 1);
fpspecplot1 = fpspec_simdata;
snr1 = snr_simdata;
mean_snr1 = mean(snr1);
std_snr1 = std(snr1);
fpspecplot2 = abfil_fpspec_simdata;


% mod2preSINGLE
% mod2SIGNAL_r3
% mod3FSPEC_r4
% mod4et5preFILTER5preFILTER.m
% sigplot2 = signal_simdata(:, 1);
% fpspecplot2 = fpspec_simdata;
% snr2 = snr_simdata;
% mean_snr2 = mean(snr2);
% std_snr2 = std(snr2);


% waveC = sin(linspace(0, 80*pi, 10000));
% waveM = gaussmf(linspace(0, 80*pi, 10000), [4*pi, 40*pi]);

% waveS = simg1temp.signal + simg2temp.signal;
% waveN = whitenoise;

% figure(3181);
%     subplot(2,1,1);
%     plot(time_sig, waveS);
%     xlabel('time (s)');
%     ylabel('normalised amplitude');
%     % axis off;
%     
%     subplot(2,1,2);
%     plot(time_sig, waveN);
%     xlabel('time (s)');
%     ylabel('normalised amplitude');
%     % axis off;
%     
% figure(3182);
%     plot(time_sig, SAW_simtemp);
%     xlabel('time (s)');
%     ylabel('normalised amplitude');
%     % axis off;


% figure(1);
%     subplot(2,1,1);
%     plot(time_sig, sigplot1);
%     title('(a)');
%     xlabel('time (s)');
%     ylabel('normalised amplitude');
%     
%     subplot(2,1,2);
%     plot(time_sig, sigplot2);
%     title('(b)');
%     xlabel('time (s)');
%     ylabel('normalised amplitude');
    
figure(2);
    subplot(2,1,1);
    plot(fp_ft, fpspecplot1);
    xlabel('frequency (Hz)');
    ylabel('normalised amplitude');
    
    subplot(2,1,2);
    plot(IRDB.abfil_ft, fpspecplot2);
    title('(b)');
    xlabel('frequency (Hz)');
    ylabel('normalised amplitude');
    
figure(45);
    subplot(1,2,1);
    imagesc(0:10:170, fp_ft, fpspecplot1);
    xlabel('angle (degree)');
    ylabel('frequency (Hz)');
    
    subplot(1,2,2);
    imagesc(0:10:170, IRDB.abfil_ft, fpspecplot2);
    xlabel('angle (degree)');
    ylabel('frequency (Hz)');

% fmat_range = [0 4000]; % frequency matrix range
% [f_scale, raw_polar] = func_rawdata2polarplot(fpspecplot1, fmat_range);
% figure(3);
%     s = surf(f_scale, f_scale, raw_polar + 0.5);
%     s.EdgeColor = 'none';
%     hold on;
%     im =imagesc(f_scale, f_scale, raw_polar + 0.5);
%     title('(c)');
%     im.axis = 'image';
%     hold off;
    
% [f_scale, raw_polar] = funcrawdata2polarplot(fpspecplot2, fmat_range);
% figure(4);
%     imagesc(f_scale, f_scale, raw_polar);
%     title('(d)');
%     axis image;
