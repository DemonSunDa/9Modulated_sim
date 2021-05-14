mod1CONSTANTS_r3
mod2preSINGLE
mod2SIGNAL_r3
mod3FSPEC_r4
sigplot1 = signal_simdata(:, 1);
fpspecplot1 = fpspec_simdata(:, 1);


% mod2preSINGLE
% mod2SIGNAL_r3
% mod3FSPEC_r4
% sigplot2 = signal_simdata(:, 1);
% fpspecplot2 = fpspec_simdata(:, 1);


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
    
% figure(2);
%     subplot(2,1,1);
%     plot(fp_ft, fpspecplot1);
%     title('(a)');
%     xlabel('frequency (Hz)');
%     ylabel('normalised amplitude');
%     
%     subplot(2,1,2);
%     plot(fp_ft, fpspecplot2);
%     title('(b)');
%     xlabel('frequency (Hz)');
%     ylabel('normalised amplitude');

fmat_range = [0 4000]; % frequency matrix range
[f_scale, raw_polar] = rawdata2polarplot(fpspec_simdata, fmat_range);

figure(3);
set(gcf,'unit','normalized','position',[0 0.05 0.4 0.6]);
    im = imagesc(f_scale, f_scale, raw_polar);
    axis image
