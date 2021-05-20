% clc;
% clear variables;

select_acv = '57-58';

% str_acv = sprintf('.\\ACVMS\\ACV%s.mat', select_acv);
% str_rvl = sprintf('.\\ACVMS\\ACV%s_REVAL.mat', select_acv);
% load(str_acv);
% load(str_rvl);
% 
% % load('.\ACVMS\storage\ACV43_IR.mat');
% % load('.\ACVMS\storage\ACV43_REVAL.mat');
% 
% 
% sz_noise = sz_simresult(6);
% sz_n_step = sz_simresult(5);
% sz_n_fringe = sz_simresult(4);
% 
% max_R11 = zeros(sz_noise, sz_n_step, sz_n_fringe);
% mean_R11 = zeros(sz_noise, sz_n_step, sz_n_fringe);
% std_R11 = zeros(sz_noise, sz_n_step, sz_n_fringe);
% 
% for ctr_noise = 1 : sz_noise
% for ctr_n_step = 1 : sz_n_step
% for ctr_n_fringe = 1 : sz_n_fringe
%     temp_grain = zeros(sz_simresult(1), 1);
%     for ctr_grain = 1 : sz_simresult(1)
%        temp_grain(ctr_grain) =...
%            min(reval(ctr_grain, 1,1, ctr_n_fringe, ctr_n_step, ctr_noise).R11);
%     end
%     max_R11(ctr_noise, ctr_n_step, ctr_n_fringe) = max(temp_grain);
%     mean_R11(ctr_noise, ctr_n_step, ctr_n_fringe) = mean(temp_grain);
%     std_R11(ctr_noise, ctr_n_step, ctr_n_fringe) = std(temp_grain);
% end % n_fringe
% end % n_step
% end % noise_level


[ns, nl, nf] = meshgrid([9,18,36,90,180], [0, 0.1, 0.15, 0.20], [4, 8, 12, 16]);
figure(501);
    s = slice(ns, nl, nf, mean_R11, [], [], [12]);
    % title('(a)');
    axis tight;
    xlabel('Rotation Number');
    ylabel('Noise Level');
    zlabel('Fringe Number');
    colorbar;
    for ctr_s = 1 : size(s, 1)
        s(ctr_s).EdgeColor = 'w';
        % s(ctr_s).FaceAlpha = 0.75;
    end
view(-120,20);
    
str_fig = sprintf('.\\ACVMS\\ACV%s_FIG.fig', select_acv);
str_ana = sprintf('.\\ACVMS\\ACV%s_ANA.mat', select_acv);
savefig(str_fig);
% save(str_ana, 'max_R11', 'mean_R11', 'std_R11');
