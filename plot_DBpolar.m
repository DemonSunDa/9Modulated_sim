clear variables;
load('..\mat\1CONSTANTS.mat');

arr_plot1 = [squeeze(DB.sv_m(21,20,:,1)); squeeze(DB.sv_m(21,20,:,1))];
figure(321);
    polarplot(arr_plot1);
    
arr_plot2 = [squeeze(DB.sv_m(21,19,:,1)); squeeze(DB.sv_m(21,19,:,1))];
figure(322)
    polarplot(arr_plot2);

% arr_plot3 = [arr_plot2(91:360);arr_plot2(1:90)];
% figure(323);
%     polarplot(arr_plot3);
% 
% arr_plotpre4 = flipud(arr_plot3);
% arr_plot4 = [arr_plot1, arr_plotpre4];
% figure(324)
%     polarplot(arr_plot4, ':');