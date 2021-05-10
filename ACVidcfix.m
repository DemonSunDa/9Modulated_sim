clc;
clear variables;
load('.\ACVMS\IR_ACV29');

for ctr6 = 1 : sz_simresult(6)
    for ctr5 = 1 : sz_simresult(5)
        for ctr4 = 1 : sz_simresult(4)
            for ctr3 = 1 : sz_simresult(3)
                for ctr2 = 1 : sz_simresult(2)
                    for ctr1 = 1 : sz_simresult(1)
                        if (~isempty(stArr_simresult(ctr1,ctr2,ctr3,ctr4,ctr5,ctr6).val_corr_g2))
                            stArr_simresult(ctr1,ctr2,ctr3,ctr4,ctr5,ctr6).idc_mix...
                                = 2;
                        else
                            stArr_simresult(ctr1,ctr2,ctr3,ctr4,ctr5,ctr6).idc_mix...
                                = 1;
                        end
                    end
                end
            end
        end
    end
end

str_acv = sprintf('.\\ACVMS\\ACV%d_FS.mat', ctr_acv);
save(str_acv, 'SC', 'ctr_acv', 'sel', 'stArr_simresult', 'sz_simresult', 'vec');
