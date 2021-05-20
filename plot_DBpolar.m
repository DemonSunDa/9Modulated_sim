clear variables;
load('.\mat\1CONSTANTS.mat');

% arr_plot1 = [squeeze(DB.sv_m(21,20,:,1)); squeeze(DB.sv_m(21,20,:,1))];
% figure(321);
%     polarplot(arr_plot1);
    
% arr_plot2 = [squeeze(DB.sv_m(21,19,:,1)); squeeze(DB.sv_m(21,19,:,1))];
% figure(322)
%     polarplot(arr_plot2);

% arr_plot3 = [arr_plot2(91:360);arr_plot2(1:90)];
% figure(323);
%     polarplot(arr_plot3);
% 
% arr_plotpre4 = flipud(arr_plot3);
% arr_plot4 = [arr_plot1, arr_plotpre4];
% figure(324)
%     polarplot(arr_plot4, ':');

for ctr_x = 1 : 2 : 21
    for ctr_y = 1 : 2 : 21
        arr_plot = [squeeze(DB.sv_m(ctr_x,ctr_y,:,1)); squeeze(DB.sv_m(ctr_x,ctr_y,:,1))];
        pp = polarplot(arr_plot);
        pp.LineWidth = 5;
        axis([0, 360, 0, 4]);
        str_OUT = sprintf('.\\DBfig\\DB%d_%d.png', ctr_x, ctr_y);
        saveas(gcf, str_OUT);
    end
end