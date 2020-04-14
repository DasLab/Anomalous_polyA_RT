load save_AllData_HiTRACE_042018_Ann_TOD_S1S7ext1-7_SSIII_RTase_StandardizationExample

plot_labels = {'original','base pair A -1','base pair A -2, -1','base pair A -3 to -1','base pair A -4 to -1','base pair A -5 to -1','base pair A -6 to -1','base pair A -7 to -1'};
highlight_col_sets = {  [2+9*[0:7], 1+9*[0:7]], [9+9*[0:7], 8+9*[0:7]], ...
    [2+9*[8:15],1+9*[8:15]], [9+9*[8:15], 8+9*[8:15]] };
modifier = {'1M7 (SHAPE)','DMS','1M7 (SHAPE)','DMS'};
construct = {'S1','S1','S7','S7'};
construct_num = [1,1,9,9];

set(figure(10),'Position',[1         648        1417         281]);
for n = 1:length( highlight_col_sets )
    clf;
    highlight_cols = highlight_col_sets{n};
    image( 40*quick_norm(d_all( :, highlight_cols ))' );
    
    colormap( 1-gray(100));
    set(gca,'yticklabel', [plot_labels,plot_labels],'ytick',[1:length(highlight_cols)] );
    make_lines_horizontal()
    set(gca,'xlim',[150 2500]);
    hold on
    for i = 2:length( xsel{1} )
        text( xsel{construct_num(n)}(i),0,sequence{construct_num(n)}(seqpos(i)),'verticalalign','bottom','horizontalalign','center','fontweight','bold' );
    end
    %text( xsel{construct_num(n)}(1),0,'fully extended','rotation',90);
    % for i = 1:11;
    %     pos = 18-i;
    %     text( xsel{i}(find(seqpos == pos)),-1.5,num2str(-i),...
    %         'verticalalign','bottom','horizontalalign','center','fontweight','bold' );
    % end
    
    
    set_labels = { [construct{n},', ',modifier{n}],  [construct{n},', no mod']};
    for i = 1:length( set_labels )
        text(2505,4+8*(i-1),set_labels{i},'horizontalalign','right','verticalalign','middle','fontsize',14);
    end
    
    set( gca,'xdir','reverse','yaxisloc','right','xtick',[] );
    set(gca,'fontweight','bold' );
    make_lines_horizontal( [0:8:16],'k',2);
    xlabel( 'Electrophoresis direction' );
    filename = sprintf( 'TOD_StemExtension_SI_PAPER_%3s_%s.pdf', modifier{n}(1:3),construct{n});
    export_fig( filename ); fprintf( 'Outputting to: %s\n', filename );    
end
 