% load save_HiTRACE_042018_Ann_TOD_S1S7ext1-7_SSIII_RTase_StandardizationExample
figure(6)
clf;
subplot(1,1,1)
% 1M7
set(gcf,'position',[200 800 600 200]);
set(gca,'position',[0.07 0.25 0.60 0.56] );

display_array = data_out;
sequence_S1 = sequence{1};

%display_array = area_peak(2:end,saturated_idx);
GAGUA_pos = strfind( sequence_S1, 'GAGUA' ); % 13 133
refpos = [ GAGUA_pos(1) + [0:4], GAGUA_pos(2)+[0:4] ];

highlight_cols = [1:8];
%plot_labels = {'S1','base pair A -1','base pair A -2, -1','base pair A -3 to -1','base pair A -4 to -1','base pair A -5 to -1','base pair A -6 to -1','base pair A -7 to -1'};
plot_labels = {'TOD-S1','TOD-S1-stemext1','TOD-S1-stemext2','TOD-S1-stemext3','TOD-S1-stemext4','TOD-S1-stemext5','TOD-S1-stemext6','TOD-S1-stemext7'};
norm_res = 11:130;

% here's the heat map
display_array_norm = quick_norm(display_array( :, highlight_cols ), norm_res );

refval = mean(mean( display_array_norm(refpos,:) ));

imagesc( seqpos_out, [1:length(highlight_cols)], display_array_norm',[0 refval*1.5] )
colormap( 1 - gray(100))
make_lines_horizontal([],'k',0.5)
make_lines( [], 'k', 0.5)
subexpt_bounds = [];
for n = 2:length( highlight_cols);
    if highlight_cols(n) > highlight_cols(n-1)+2; subexpt_bounds = [subexpt_bounds,n-1]; end;
end
make_lines_horizontal(subexpt_bounds,'k',2);
          
set( gca,'xtick',0:10:length(seqpos_out),'ytick',[1:length(highlight_cols)], 'yticklabel', plot_labels);
%set(gca,'ticklabelinterpreter','none' )


% original focus.
minres = 81;
maxres = 101;

% expand
%minres = 21;
%maxres = 131;

set(gca,'tickdir','out','xlim',[minres-0.5 maxres+0.5],'yaxislocation','right')
set(gcf, 'PaperPositionMode','auto','color','white');
for i = minres:maxres; 
    text( seqpos_out(i), 0.5, upper(sequence_S1( seqpos_out(i)-offset )), 'horizontalalign','center','verticalalign','bottom','fontweight','bold','clipping','off','fontsize',13)
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
Astretch = strfind( sequence_S1, Aseq );
Astretch = Astretch(end);
for j = 1:length( Aseq )
    text( Astretch+j-0.8, -0.8, num2str(j-1-length(Aseq)),'fontsize',11,'horizontalalign','right','verticalalign','bottom','clipping','off' );
end

colorbar('westoutside');

%export_fig( 'TOD_StemExtension_PAPER_Figure.pdf' );

