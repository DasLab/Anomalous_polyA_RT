image( 40*quick_norm(d_align(:, highlight_cols ))' );
set(gcf, 'PaperPositionMode','auto','color','white');
colormap( 1-gray(100));
set(gca,'yticklabel', plot_labels,'ytick',[1:length(highlight_cols)] );
make_lines_horizontal();
set(gca,'xlim',xlimits);

hold on
S7_pos = strfind( sequence_plot,'AAAAAACAAAA' )+7;
for i = 2:length( xsel )
    h = text( xsel(i),0.5,upper(sequence_plot(seqpos(i))),'verticalalign','bottom','horizontalalign','center','fontweight','bold' );
    if ( ~isempty(find(i==S7_pos)) ); set( h,'color','m' ); end;
end


make_lines_horizontal( [0:set_size:set_size*length(set_labels)],'k',2);
hold on
% annotate poly(A) stretches.
Aseq = 'AAAAAAAAAAA';
Astretches = strfind( sequence, Aseq );
for Astretch = Astretches;
    for j = 1:length( Aseq )
        text( xsel( find(seqpos == (Astretch+j-1)) ), -0.5, num2str(j-1-length(Aseq)),'fontsize',8,'horizontalalign','center','verticalalign','bottom','clipping','off' );
    end
    xsel_Abox_min = mean( xsel( find(seqpos == Astretch) + [0 -1] ) );
    xsel_Abox_max = mean( xsel( find(seqpos == Astretch+length(Aseq)-1) + [0 1] ) );
    plot( [xsel_Abox_min xsel_Abox_max xsel_Abox_max xsel_Abox_min xsel_Abox_min], [-2, -2, length(highlight_cols)+0.6, length(highlight_cols)+0.6 -2 ],...
        'clipping','off','color',[0 0.5 0.1],'linew',1.5 );
end

for i = 1:length( set_labels )
    text(xlimits(2),set_size/2+set_size*(i-1),set_labels{i},'horizontalalign','right','verticalalign','middle','fontsize',14);
end

    
set( gca,'xdir','reverse','yaxisloc','right','xtick',[] );
set(gca,'fontweight','bold' );
xlabel( 'Electrophoresis direction' );
