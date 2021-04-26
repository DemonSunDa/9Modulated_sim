% abrupt filter
    fth.offset_max = 0.3e3; % threshold offset for max v
    fth.offset_min = 0.3e3; % threshold offset for min v
    fth.calmax = (DB.v_max + fth.offset_max) / SC.lambda; % find the maximum possible f plus th
    fth.calmin = (DB.v_min - fth.offset_min) / SC.lambda; % find the minimum possible f minus th
    [fth.valmax_ln, fth.valmax_col, fth.valmax] = find(abs(fp_ft - fth.calmax) < (fp_res / 2));
    [fth.valmin_ln, fth.valmin_col, fth.valmin] = find(abs(fp_ft - fth.calmin) < (fp_res / 2));
    IRDB.abfil_ft = fp_ft(fth.valmin_col : fth.valmax_col);
    abfil_fpspec_simdata = fpspec_simdata(fth.valmin_col : fth.valmax_col, :);
% end abrupt filter