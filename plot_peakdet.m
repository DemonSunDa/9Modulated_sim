figure(414);
subplot(2,1,2);
plot(IRDB.abfil_ft, abfil_fpspec_simdata(:, 1),...
    '-x','MarkerIndices' , peak.idx(1: peak.ctr(1), 1),...
    'MarkerSize', 15, 'MarkerEdgeColor', 'red');
    title('(b)');
    xlabel('Frequency');
    ylabel('Amplitude');