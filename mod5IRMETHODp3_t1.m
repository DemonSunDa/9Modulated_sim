% MODULUS 5IRMETHODp3
%   find the matching grain data


% clear variables;
% fprintf('LOADING\n');
% load('1CONSTANTS.mat');
% load('2cal_simdata.mat');
% load('5IRDB.mat');
% load('IR_ACV1.mat');


max_ircorr = max(max(max(ircorr_simdata)));
ind = find(abs(ircorr_simdata - max(max(max(ircorr_simdata)))) < 5e-5);
idx_corr = zeros(size(ind, 1), 3);
val_corr = zeros(size(ind, 1), 4);
for ctr = 1 : size(ind, 1)
    [I1, I2, I3] = ind2sub(size(ircorr_simdata), ind(ctr));
    idx_corr(ctr, 1) = I1;
    idx_corr(ctr, 2) = I2;
    idx_corr(ctr, 3) = I3;
    val_corr(ctr, 1) = DB.x_cut(I1);
    val_corr(ctr, 2) = DB.y_cut(I2);
    val_corr(ctr, 3) = DB.deg(I3);
    val_corr(ctr, 4) = ircorr_simdata(I1, I2, I3);
end


% OUTPUT save
    save('.\mat\5irc_simresult.mat', 'idx_corr', 'val_corr');
    % fprintf('IRMETHODp3 DONE\n');
% end output save
