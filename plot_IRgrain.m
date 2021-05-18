clc;
clear variables;

select_acv = '53';
select_noise = 1;
select_n_step = 1;
select_fringe = 1;

str_acv = sprintf('.\\ACVMS\\ACV%s.mat', select_acv);
str_rvl = sprintf('.\\ACVMS\\ACV%s_REVAL.mat', select_acv);
load(str_acv);
load(str_rvl);

% load('.\ACVMS\storage\ACV43_IR.mat');
% load('.\ACVMS\storage\ACV43_REVAL.mat');


plotRE1_st = squeeze(reval(:,1,1,select_fringe,select_n_step,select_noise));

sz_x = size(vec.x, 2);
sz_y = size(vec.y, 2);
sz_deg = size(vec.deg, 2);

for ctr_x = 1 : sz_x
    for ctr_y = 1 : sz_y
        for ctr_deg = 1 : sz_deg
            plotRE1_R11(ctr_x, ctr_y, ctr_deg) =...
                min(plotRE1_st(ctr_deg+(ctr_y-1)*sz_deg+(ctr_x-1)*ctr_y*ctr_deg).R11);
        end
    end
end

max_R11 = max(plotRE1_R11, [], 'all');
mean_R11 = mean(plotRE1_R11, 'all');
std_R11 = std(plotRE1_R11, 0, 'all');

figure(408);
    s = slice(vec.x, vec.y, vec.deg, plotRE1_R11, [], [], vec.deg);
    title('(b)');
    xlabel('Miller x');
    ylabel('Miller y');
    zlabel('angle');
    for ctr_s = 1 :sz_deg
        % s(ctr_s).FaceColor = 'none';
        s(ctr_s).EdgeColor = 'none';
        s(ctr_s).FaceAlpha = 0.75;
    end
view(-60,10);
    
str_fig = sprintf('.\\ACVMS\\ACV%s_FIG%d_%d_%d.fig', select_acv, select_noise, select_n_step, select_fringe);
str_ana = sprintf('.\\ACVMS\\ACV%s_ANA%d_%d_%d.mat', select_acv, select_noise, select_n_step, select_fringe);
savefig(str_fig);
save(str_ana, 'max_R11', 'mean_R11', 'std_R11');
