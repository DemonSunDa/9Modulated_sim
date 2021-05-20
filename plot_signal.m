% mod1CONSTANTS_r3
% 
% mod2preSINGLE_pseudo
% mod2SIGNAL_r3
% mod3FSPEC_r4
% mod4et5preFILTER
% sigplot1 = signal_simdata(:, 1);
% fpspecplot1 = fpspec_simdata;
% snr1 = snr_simdata;
% mean_snr1 = mean(snr1);
% std_snr1 = std(snr1);
fpspecplot1 = abfil_fpspec_simdata_old;
fpspecplot2 = abfil_fpspec_regen;


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
    subplot(3,1,1);
    plot(IRDB.abfil_ft, fpspecplot1);
    title('(a)');
    xlabel('frequency (Hz)');
    ylabel('normalised amplitude');
    
    subplot(3,1,2);
    plot(IRDB.abfil_ft, fpspecplot2(:,:,1));
    title('(b)');
    xlabel('frequency (Hz)');
    ylabel('normalised amplitude');
    
    subplot(3,1,3);
    plot(IRDB.abfil_ft, fpspecplot2(:,:,2));
    title('(c)');
    xlabel('frequency (Hz)');
    ylabel('normalised amplitude');
    
% figure(45);
%     subplot(2,1,1);
%     imagesc(0:10:170, fp_ft, fpspecplot1);
%     title('(c)');
%     xlabel('angle (degree)');
%     ylabel('frequency (Hz)');
%     
%     subplot(2,1,2);
%     imagesc(0:10:170, IRDB.abfil_ft, fpspecplot2);
%     title('(d)');
%     xlabel('angle (degree)');
%     ylabel('frequency (Hz)');

fmat_range = [0 4000]; % frequency matrix range
[f_scale, raw_polar] = func_rawdata2polarplot(cat(1, zeros(394, 36), fpspecplot1, zeros(268, 36)), fmat_range);
figure(3);
%     s = surf(f_scale, f_scale, raw_polar + 0.5);
%     s.EdgeColor = 'none';
%     hold on;
    im =imagesc(f_scale, f_scale, raw_polar + 0.5);
    title('(d)');
    axis image;
%     hold off;
    
[f_scale, raw_polar] = func_rawdata2polarplot(cat(1, zeros(394, 36), fpspecplot2(:,:,1), zeros(268, 36)), fmat_range);
figure(4);
    imagesc(f_scale, f_scale, raw_polar);
    title('(e)');
    axis image;

[f_scale, raw_polar] = func_rawdata2polarplot(cat(1, zeros(394, 36), fpspecplot2(:,:,2), zeros(268, 36)), fmat_range);
figure(5);
    imagesc(f_scale, f_scale, raw_polar);
    title('(f)');
    axis image;
