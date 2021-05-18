clc;
clear variables;

select_acv = '56';
select_noise = 2;
select_n_step = 1;
select_fringe = 1;

str_acv = sprintf('.\\ACVMS\\ACV%s.mat', select_acv);
str_rvl = sprintf('.\\ACVMS\\ACV%s_REVAL.mat', select_acv);
load(str_acv);
load(str_rvl);

% load('.\ACVMS\storage\ACV43_IR.mat');
% load('.\ACVMS\storage\ACV43_REVAL.mat');


plotRE_st = squeeze(reval(:,:,1,select_fringe,select_n_step,select_noise));

sz_g1 = sz_simresult(1);
sz_g2 = sz_simresult(1);

plotRE_R11 = zeros(sz_g1, sz_g2);
plotRE_R21 = zeros(sz_g1, sz_g2);
plotRE_R12 = zeros(sz_g1, sz_g2);
plotRE_R22 = zeros(sz_g1, sz_g2);

plotRE_R1 = zeros(sz_g1, sz_g2);
plotRE_R2 = zeros(sz_g1, sz_g2);

for ctr_g1 = 1 : sz_g1
    for ctr_g2 = 1 : sz_g2
        plotRE_R11(ctr_g1, ctr_g2) =...
            min(plotRE_st(ctr_g1, ctr_g2).R11);
        plotRE_R21(ctr_g1, ctr_g2) =...
            min(plotRE_st(ctr_g1, ctr_g2).R21);
        if plotRE_st(ctr_g1, ctr_g2).idc_mix == 2
            plotRE_R12(ctr_g1, ctr_g2) =...
                min(plotRE_st(ctr_g1, ctr_g2).R12);
            plotRE_R22(ctr_g1, ctr_g2) =...
                min(plotRE_st(ctr_g1, ctr_g2).R22);
            
            if (plotRE_R11(ctr_g1, ctr_g2) + plotRE_R22(ctr_g1, ctr_g2)) < (plotRE_R12(ctr_g1, ctr_g2) + plotRE_R21(ctr_g1, ctr_g2))
                plotRE_R1(ctr_g1, ctr_g2) = plotRE_R11(ctr_g1, ctr_g2);
                plotRE_R2(ctr_g1, ctr_g2) = plotRE_R22(ctr_g1, ctr_g2);
            else
                plotRE_R1(ctr_g1, ctr_g2) = plotRE_R21(ctr_g1, ctr_g2);
                plotRE_R2(ctr_g1, ctr_g2) = plotRE_R12(ctr_g1, ctr_g2);
            end
        else
            plotRE_R12(ctr_g1, ctr_g2) = NaN;
            plotRE_R22(ctr_g1, ctr_g2) = NaN;
                
            plotRE_R1(ctr_g1, ctr_g2) = min(plotRE_R11(ctr_g1, ctr_g2), plotRE_R21(ctr_g1, ctr_g2));
            plotRE_R2(ctr_g1, ctr_g2) = NaN;
        end
    end
end


max_R1 = max(plotRE_R1, [], 'all');
mean_R1 = mean(plotRE_R1, 'all');
std_R1 = std(plotRE_R1, 0, 'all');
ctr_num = 0;
for ctr_g1r = 1 : sz_g1
    for ctr_g2r = 1 : sz_g2
        if ~isnan(plotRE_R2(ctr_g1r, ctr_g2r))
            ctr_num = ctr_num + 1;
            temp_num(ctr_num) = plotRE_R2(ctr_g1r, ctr_g2r);
        end
    end
end

max_R2 = max(temp_num);
mean_R2 = mean(temp_num);
std_R2 = std(temp_num);


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
    
% str_fig = sprintf('.\\ACVMS\\ACV%s_FIG%d_%d_%d.fig', select_acv, select_noise, select_n_step, select_fringe);
% str_ana = sprintf('.\\ACVMS\\ACV%s_ANA%d_%d_%d.mat', select_acv, select_noise, select_n_step, select_fringe);
% savefig(str_fig);
% save(str_ana, 'max_R11', 'mean_R11', 'std_R11');
