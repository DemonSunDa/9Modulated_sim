% MODULUS 5IRMETHODp3
%   find the matching grain data


% // clear variables;
% // fprintf('LOADING\n');
% // load('1CONSTANTS.mat');
% // load('2cal_simdata.mat');
% // load('5IRDB.mat');
% // load('IR_ACV1.mat');


max_ircorr = max(ircorr_simdata, [], 'all');
ind = find(ircorr_simdata == max_ircorr);


% init storage
    idx_corr = zeros(size(ind, 1), 4);
    val_corr = zeros(size(ind, 1), 4);
% end init storage


for ctr_res = 1 : size(ind, 1) % for every maxima found
    [d1, d2, d3, d4] = ind2sub(size(ircorr_simdata), ind(ctr_res));
    % * d1 for angle in one deg group
    % * d2 for x
    % * d3 for y
    % * d4 for deg group
    idx_corr(ctr_res, 1) = d1;
    idx_corr(ctr_res, 2) = d2;
    idx_corr(ctr_res, 3) = d3;
    idx_corr(ctr_res, 4) = d4;

    val_corr(ctr_res, 1) = DB.x_cut(d2);
    val_corr(ctr_res, 2) = DB.y_cut(d3);
    val_corr(ctr_res, 3) = DB.deg((d1 - 1) * vsc.deg_step + d4);
    val_corr(ctr_res, 4) = ircorr_simdata(d1, d2, d3, d4);
end


% OUTPUT save
    save('.\mat\5irc_simresult.mat', 'idx_corr', 'val_corr');
    % fprintf('IRMETHODp3 DONE\n');
% end output save
