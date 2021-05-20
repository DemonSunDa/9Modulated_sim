clc;
clear variables;
load('.\mat\1CONSTANTS.mat');
load('.\mat\2cal_simdata.mat');
load('.\mat\2signal_simdata.mat');
load('.\mat\3fpspec_simdata.mat');
load('.\mat\5IRDB.mat');

mod4et5preFILTER

sz = size(IRDB.recon_fpspec);
IRDBplotpre = squeeze(IRDB.recon_fpspec(:,:,21,21,1));
IRDBplot = [IRDBplotpre, IRDBplotpre];

figure(461);
    % subplot(3,1,1);
    imagesc(0:10:170,IRDB.abfil_ft,abfil_fpspec_simdata);
    % title('(a)');
    xlabel('angle (degree)');
    ylabel('frequency (Hz)');
    
% figure(462);
%     % subplot(3,1,2);
%     imagesc(0:10:170,IRDB.abfil_ft,IRDBplot(:,:,1));
%     title('(b)');
%     xlabel('angle (degree)');
%     ylabel('frequency (Hz)');
%     
% figure(463);
%     % subplot(3,1,3);
%     imagesc(1:36,IRDB.abfil_ft,[IRDBplot(:,10:36,1), IRDBplot(:,1:9,1)]);
%     % title('(c)');
%     xlabel('angle (degree)');
%     ylabel('frequency (Hz)');
    
% figure(464);
%     sl = slice(0:10:170,IRDB.abfil_ft,1:10,IRDBplot, [], [], 1:10);
%     title('(d)'); 
%     axis square;
%     shading interp;
