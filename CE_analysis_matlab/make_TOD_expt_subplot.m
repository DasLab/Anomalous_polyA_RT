%function make_TOD_expt_subplot( highlight_cols )

% here's the heat map
if ~isempty(refpos) 
    norm_res = 11:130;
    display_array_norm = quick_norm(display_array( :, highlight_cols ), norm_res );
    meanref = mean(mean( display_array_norm(refpos,:) ));
    display_array_norm = display_array_norm / meanref;
else
    display_array_norm = display_array(:,highlight_cols);
    refval = 1.0/1.5;
end

imagesc( seqpos_out, [1:length(highlight_cols)], display_array_norm',[0 refval*1.5] )
colormap( 1 - gray(100))
make_lines_horizontal([],'k',0.5)
make_lines( [], 'k', 0.5)
subexpt_bounds = [];
for n = 2:length( highlight_cols);
    if abs(highlight_cols(n)-highlight_cols(n-1))>3; subexpt_bounds = [subexpt_bounds,n-1]; end;
end
make_lines_horizontal(subexpt_bounds,'k',2);
          
set( gca,'xtick',0:10:length(seqpos_out),'ytick',[1:length(highlight_cols)], 'yticklabel', plot_labels);
%set(gca,'ticklabelinterpreter','none' )

if ~exist('minres','var') 
    minres = 81;
    maxres = 101;
end
set(gca,'tickdir','out','xlim',[minres-0.5 maxres+0.5],'yaxislocation','right')
set(gcf, 'PaperPositionMode','auto','color','white');
for i = minres:maxres; 
    text( seqpos_out(i), 0.5, upper(sequence( seqpos_out(i)-offset )), 'horizontalalign','center','verticalalign','bottom','fontweight','bold','clipping','off','fontsize',13)
end

% annotate different sub-experiments with (a), (b) ...
% subexpt_label_pos = ([0 subexpt_bounds] + [subexpt_bounds, [5+8+4+2+4+7+8]]) /2;
% subexpt_labels = {'A','B','C','D','E','F','G'};
% for i = 1:length( subexpt_labels)
%     text( 6, subexpt_label_pos(i)+0.5, subexpt_labels{i},'verticalalign','middle','horizontalalign','center','clipping','off','fontsize',20,'fontweight','bold' );
% end

set(gca,'ticklength',[0.03 0.01])
set(gca,'fontweight','bold','fontsize',13)
xlabel( 'RNA sequence position' )
%ylabel( 'Solution condition during 1M7 (SHAPE) mapping')
box off


% annotate poly(A) stretches.
Aseq = 'AAAAAAAAAAA';
Astretch = strfind( sequence, Aseq );
Astretch = Astretch(end);
for j = 1:length( Aseq )
    text( Astretch+j-0.8, -0.8, num2str(j-1-length(Aseq)),'fontsize',11,'horizontalalign','right','verticalalign','bottom','clipping','off' );
end

%colorbar('westoutside');
