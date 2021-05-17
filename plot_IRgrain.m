clc;
clear variables;

select_acv = 40;
select = 1;

str_acv = sprintf('.\\ACVMS\\ACV%d_IR.mat', select_acv);
str_rvl = sprintf('.\\ACVMS\\ACV%d_REVAL.mat', select_acv);
load(str_acv);
load(str_rvl);


plotRE1_st = squeeze(reval(:,1,1,1,1,select));

sz_x = size(vec.x, 2);
sz_y = size(vec.y, 2);
sz_deg = size(vec.deg, 2);

for ctr_x = 1 : sz_x
    for ctr_y = 1 : sz_y
        for ctr_deg = 1 : sz_deg
            plotRE1_R11(ctr_x, ctr_y, ctr_deg) =...
                min(plotRE1_st(ctr_x+(ctr_y-1)*sz_deg+(ctr_x-1)*ctr_y*ctr_deg).R11);
        end
    end
end

max_R11 = max(plotRE1_R11, [], 'all');
mean_R11 = mean(plotRE1_R11, 'all');
std_R11 = std(plotRE1_R11, 0, 'all');

figure(408);
    s = slice(vec.x, vec.y, vec.deg, plotRE1_R11, [], [], vec.deg);
    title('(d)');
    xlabel('Miller x');
    ylabel('Miller y');
    zlabel('angle');
    for ctr_s = 1 :sz_deg
        % s(ctr_s).FaceColor = 'none';
        s(ctr_s).EdgeColor = 'none';
        s(ctr_s).FaceAlpha = 0.75;
    end
view(-60,10);
    
str_fig = sprintf('.\\ACVMS\\ACV%d_FIG%d.fig', select_acv, select);
str_ana = sprintf('.\\ACVMS\\ACV%d_ANA%d.mat', select_acv, select);
savefig(str_fig);
save(str_ana, 'max_R11', 'mean_R11', 'std_R11');
