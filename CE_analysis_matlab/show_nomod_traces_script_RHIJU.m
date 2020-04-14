% [d, d_ref, ylim, labels ] = quick_look( 'CE data-TOD-Synnthesized-S1-41/121018_SynS1_41_NM' )
for i = 1:length( labels )
    subplot(12,1,i)
    area( d(:,i) )
    title( labels{i} )
end
set(gcf, 'PaperPositionMode','auto','color','white');

