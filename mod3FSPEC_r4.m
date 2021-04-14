% MODULUS 3FSPEC
%   generate frequency spectrum
% DEPENDENCY
%   1CONSTANTS.mat
%   2cal_simdata.mat
%   2signal_simdata.mat
% FILE OUTPUT
%   3fspec_simdata.mat
%   3fpsepec_simdata.mat


% clear variables;
% fprintf('3FSPEC\nLOADING\n');
% load('.\mat\1CONSTANTS.mat');
% load('.\mat\2cal_simdata.mat');
% load('.\mat\2signal_simdata.mat');


% init
    % fft params
        L_ft = 2e3; % frequency sample length
        fp_ft = Fs * (0 : (L_ft / 2)) / L_ft; % sample frequency domain with padding
        f_res = Fs / L_sig;
        fp_res = Fs / L_ft;
        fp_ores = f_res;
    % end fft params

    % storage
    fpspec_simdata = zeros(length(fp_ft), vsc.n_step); % init storage for simulated frequency spectrum with padding
% end init


% loop for 180 degrees
    for ctr_ft = 1 : vsc.n_step
        % fft with padding
        fp_raw = fft(signal_simdata(:, ctr_ft), L_ft); % L_ft is the padding number and sample length
        fp_spectrum2 = abs(fp_raw / L_sig);
        fp_spectrum = fp_spectrum2(1 : (L_ft / 2 + 1));
        fp_spectrum(2 : end - 1) = 2 * fp_spectrum(2 : end - 1);
        
        % store
        fpspec_simdata(:, ctr_ft) = fp_spectrum; % simulated f-surface sample data
    % end fft with padding
    end
% end loop for 180 degrees


% OUTPUT save
    save('.\mat\3fpspec_simdata.mat', 'L_ft', 'fp_ft', 'fp_res', 'fp_ores', 'fpspec_simdata');
    fprintf('FSPEC DONE\n');
% end output save
