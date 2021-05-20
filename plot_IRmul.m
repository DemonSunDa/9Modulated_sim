clc;
clear variables;

select_acv = '51';
select_noise = 2;
select_n_step = 1;
select_fringe = 1;
select_prop = 3;

str_acv = sprintf('.\\ACVMS\\ACV%s.mat', select_acv);
str_rvl = sprintf('.\\ACVMS\\ACV%s_REVAL.mat', select_acv);
load(str_acv);
load(str_rvl);


plotRE_st = squeeze(reval(:,:,select_prop,select_fringe,select_n_step,select_noise));

sz_g1 = sz_simresult(1);
sz_g2 = sz_simresult(2);

plotRE_R11 = zeros(sz_g1, sz_g2);
plotRE_R21 = zeros(sz_g1, sz_g2);
for ctr_g1 = 1 : sz_g1
    for ctr_g2 = 1 : sz_g2
        plotRE_R11(ctr_g1, ctr_g2) =...
            min(plotRE_st(ctr_g1, ctr_g2).R11);
        plotRE_R21(ctr_g1, ctr_g2) =...
            min(plotRE_st(ctr_g1, ctr_g2).R21);
    end
end

max_R11 = max(plotRE_R11, [], 'all');
mean_R11 = mean(plotRE_R11, 'all');
std_R11 = std(plotRE_R11, 0, 'all');

max_R21 = max(plotRE_R21, [], 'all');
mean_R21 = mean(plotRE_R21, 'all');
std_R21 = std(plotRE_R21, 0, 'all');


figure(411);
    subplot(2,1,1);
    imagesc(plotRE_R11);
    title('(e)');
    xlabel('Grain 1');
    ylabel('Grain 2');
    axis image;
    
    subplot(2,1,2);
    imagesc(plotRE_R21);
    title('(f)');
    xlabel('Grain 1');
    ylabel('Grain 2');
    axis image;


% figure(408);
%     s = slice(vec.x, vec.y, vec.deg, plotRE1_R11, [], [], vec.deg);
%     title('(b)');
%     xlabel('Miller x');
%     ylabel('Miller y');
%     zlabel('angle');
%     for ctr_s = 1 :sz_deg
%         % s(ctr_s).FaceColor = 'none';
%         s(ctr_s).EdgeColor = 'none';
%         s(ctr_s).FaceAlpha = 0.75;
%     end
% view(-60,10);
    
str_fig = sprintf('.\\ACVMS\\ACV%s_FIG%d_%d_%d_%d.fig', select_acv, select_noise, select_n_step, select_fringe, select_prop);
str_ana = sprintf('.\\ACVMS\\ACV%s_ANA%d_%d_%d_%d.mat', select_acv, select_noise, select_n_step, select_fringe, select_prop);
savefig(str_fig);
save(str_ana, 'max_R11', 'mean_R11', 'std_R11', 'max_R21', 'mean_R21', 'std_R21');
