% input
    fpspec_low = fpspec_simdata;
    fp_ft_low = fp_ft;
% end input


% init
    Fs = 5e8;
    L_sig = 1e2; % signal length
    time_sig = (0 : (L_sig - 1)) / Fs; % signal time domain
    L_ft = 2e3; % frequency sample length
    fp_ft = Fs * (0 : (L_ft / 2)) / L_ft; % sample frequency domain with padding
    f_res = Fs / L_sig;
    fp_res = Fs / L_ft;
    fp_ores = f_res;

    % storage
    fpspec_simdata = zeros(1001, 18);
% end init


% fit
    for ctr_rot = 1 : 18
        for ctr_fit = 1 : length(fp_ft_low)
            [val_f, ind_f] = min(abs(fp_ft - fp_ft_low(ctr_fit)));
            fpspec_simdata(ind_f, ctr_rot) = fpspec_low(ctr_fit, ctr_rot);
        end
    end
% end fit

