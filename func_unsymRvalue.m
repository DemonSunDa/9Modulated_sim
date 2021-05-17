function [valR] = func_unsymRvalue(x1_IN, y1_IN, deg1_IN, x2_IN, y2_IN, deg2_IN)
    % this function find all the symmetries for sim from database (2)
    if (x2_IN <= 0.1 ) && (y2_IN <= 0.1) % four-fold
        sz_g = 6;
        grain_temp = zeros(sz_g, 3);

        grain_temp(1,:) = [x2_IN, y2_IN, deg2_IN - 180];
        grain_temp(2,:) = [x2_IN, y2_IN, deg2_IN - 90];
        grain_temp(3,:) = [x2_IN, y2_IN, deg2_IN];
        grain_temp(4,:) = [x2_IN, y2_IN, deg2_IN + 90];
        grain_temp(5,:) = [x2_IN, y2_IN, deg2_IN + 180];
        if deg2_IN < 90
            grain_temp(6,:) = [x2_IN, y2_IN, deg2_IN + 270];
        else
            grain_temp(6,:) = [x2_IN, y2_IN, deg2_IN - 270];
        end
    elseif (x2_IN >= 0.9) && (y2_IN >= 0.9) % six-fold
        sz_g = 9;
        grain_temp = zeros(sz_g, 3);

        grain_temp(1,:) = [x2_IN, y2_IN, deg2_IN - 180];
        grain_temp(2,:) = [x2_IN, y2_IN, deg2_IN - 120];
        grain_temp(3,:) = [x2_IN, y2_IN, deg2_IN - 60];
        grain_temp(4,:) = [x2_IN, y2_IN, deg2_IN];
        grain_temp(5,:) = [x2_IN, y2_IN, deg2_IN + 60];
        grain_temp(6,:) = [x2_IN, y2_IN, deg2_IN + 120];
        grain_temp(7,:) = [x2_IN, y2_IN, deg2_IN + 180];
        if deg2_IN < 60
            grain_temp(8,:) = [x2_IN, y2_IN, deg2_IN + 240];
            grain_temp(9,:) = [x2_IN, y2_IN, deg2_IN + 300];
        elseif (deg2_IN < 120) && (deg2_IN >= 60)
            grain_temp(8,:) = [x2_IN, y2_IN, deg2_IN - 240];
            grain_temp(9,:) = [x2_IN, y2_IN, deg2_IN + 240];
        else
            grain_temp(8,:) = [x2_IN, y2_IN, deg2_IN - 240];
            grain_temp(9,:) = [x2_IN, y2_IN, deg2_IN - 300];
        end
    else
        sz_g = 7;
        grain_temp = zeros(sz_g, 3);

        grain_temp(1,:) = [x2_IN, y2_IN, deg2_IN - 180];
        grain_temp(2,:) = [x2_IN, y2_IN, deg2_IN];
        grain_temp(3,:) = [x2_IN, y2_IN, deg2_IN + 180];
        grain_temp(4,:) = [y2_IN, x2_IN, deg2_IN - 270];
        grain_temp(5,:) = [y2_IN, x2_IN, deg2_IN - 90];
        grain_temp(6,:) = [y2_IN, x2_IN, deg2_IN + 90];
        grain_temp(7,:) = [y2_IN, x2_IN, deg2_IN + 270];
    end
    
    for ctr_sym = 1 : sz_g
        vec_valR(ctr_sym) =...
            func_getRvalue([x1_IN, y1_IN, 1],...
            [grain_temp(ctr_sym, 1), grain_temp(ctr_sym, 2), 1],...
            deg1_IN, grain_temp(ctr_sym, 3));
    end
    valR = min(vec_valR);
end