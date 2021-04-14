% MODULUS 2SINGNAL
%   generate signal
% DEPENDENCY
%   CONSTANTS.mat
%   2pre_IN.mat
% FILE OUTPUT
%   2cal_simdata.mat 
%   2signal_simdata.mat


% clear variables;
% load('.\mat\1CONSTANTS.mat');
% load('.\mat\2pre_IN.mat');


% init
    % signal sample params
        Fs = 5e8; % sample frequency
        L_sig = 1e2; % signal length
        time_sig = (0 : (L_sig - 1)) / Fs; % signal time domain

    % storage
    cal_simdata = zeros(6, vsc.n_step); % init storage for calculated f and v
        % row 1 for g1 deg
        % row 2 for g1 v
        % row 3 for g1 f
        % row 4 for g2 deg
        % row 5 for g2 v
        % row 6 for g2 f
    signal_simdata = zeros(length(time_sig), vsc.n_step); % init storage for simulated signal
% end init


% loop for 180 degrees
    for ctr_siggen = 1 : vsc.n_step
    % cal
        % simg1temp and simg2temp only store grain info for current loop
        simg1temp.datadeg = initg1.deg + (ctr_siggen - 1) * vsc.deg_step;
        if  simg1temp.datadeg >= 180
            simg1temp.datadeg = simg1temp.datadeg - 180;
        end
        simg1temp.v_cal = DB.sv_m(initg1.x_miller * 20 + 1, initg1.y_miller * 20 + 1,...
            simg1temp.datadeg + 1, SC.mode) * 1e3; % in m/s
        simg1temp.f_cal = simg1temp.v_cal / SC.lambda;

        simg2temp.datadeg = initg2.deg + (ctr_siggen - 1) * vsc.deg_step;
        if  simg2temp.datadeg >= 180
            simg2temp.datadeg = simg2temp.datadeg - 180;
        end
        simg2temp.v_cal = DB.sv_m(initg2.x_miller * 20 + 1, initg2.y_miller * 20 + 1,...
            simg2temp.datadeg + 1, SC.mode) * 1e3; % in m/s
        simg2temp.f_cal = simg2temp.v_cal / SC.lambda;
        
        % store
        cal_simdata(1, ctr_siggen) = simg1temp.datadeg;
        cal_simdata(2, ctr_siggen) = simg1temp.v_cal;
        cal_simdata(3, ctr_siggen) = simg1temp.f_cal;
        cal_simdata(4, ctr_siggen) = simg2temp.datadeg;
        cal_simdata(5, ctr_siggen) = simg2temp.v_cal;
        cal_simdata(6, ctr_siggen) = simg2temp.f_cal;
    % end cal


    % signal gen
        % define that g1 is the grain closer to the detection beam
        fullamp = 1; %set the full amplitude
        simg1temp.amp = fullamp * initg1.prop;
        simg2temp.amp = fullamp * initg2.prop;

        whitenoise = (fullamp * vsc.noise_level) * rand(size(time_sig)); % set the white noise strength
        
        simg1temp.t_2d = initg1.d_2d / simg1temp.v_cal; % time from centre of g1 to detection beam
        simg2temp.t_2d = initg2.d_2d / simg2temp.v_cal; % time from centre of g2 to detection beam
        simg1temp.sigcentre = (L_sig / Fs) / 2 - (simg2temp.t_2d - simg1temp.t_2d) / 2;
        simg2temp.sigcentre = (L_sig / Fs) / 2 + (simg2temp.t_2d - simg1temp.t_2d) / 2;
        % set delay compared to graph centre 5e-8 in time
        
        % FWHM of the gauss envelope = t_fist signal - t_last signal
        % FWHM = 2 * sqrt(2 * ln2) * std ~= 2.355 * std
        simg1temp.envFWHM = vsc.patch * initg1.prop / simg1temp.v_cal;
        simg2temp.envFWHM = vsc.patch * initg2.prop / simg2temp.v_cal;
        simg1temp.envelope = gaussmf(time_sig,...
            [max(simg1temp.envFWHM / 2.355, 1e-11), simg1temp.sigcentre]);
        simg2temp.envelope = gaussmf(time_sig,...
            [max(simg2temp.envFWHM / 2.355, 1e-11), simg2temp.sigcentre]);
        % in Fuzzy Logic Toobox gaussmf(x, params); params = [std, mean]
        
        simg1temp.signal = simg1temp.envelope .*...
            (simg1temp.amp * sin(2 * pi * simg1temp.f_cal * time_sig));
        simg2temp.signal = simg2temp.envelope .*...
            (simg2temp.amp * sin(2 * pi * simg2temp.f_cal * time_sig));
        
        SAW_simtemp = simg1temp.signal + simg2temp.signal + whitenoise;
        
        % store
        signal_simdata(:, ctr_siggen) = SAW_simtemp;
    % end signal gen
    end
% end loop for 180 degrees


% OUTPUT save
    save('.\mat\2cal_simdata.mat', 'vsc', 'initg1', 'initg2', 'cal_simdata');    
    save('.\mat\2signal_simdata.mat', 'Fs', 'L_sig', 'time_sig', 'signal_simdata');
    fprintf('SIGNAL DONE\n');
% end output save
