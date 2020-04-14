%%
% load save_TOD_analysis_expts2_to_8
%%
figure(4); clf;
set(gcf,'position',[50 800 1500 950]);

subplot(2,1,1)
set(gca,'position',[0.07 0.55 0.80 0.40] );
highlight_cols = [0+12+[1:5], 36+16+[1:8], 84+8+[1:4], 120+4+[1:4],108+1+[1 4],156+8+[1:6],204+8+[1:8],...
                  0+0+[1:5], 36+0+[1:8], 84+0+[1:4],   120+0+[1:4],108+0+[1 4],156+0+[1:6],204+0+[1:8] ];
%plot_labels = labels(saturated_idx(highlight_cols));
refpos = [ GAGUA_pos(1) + [0:4], GAGUA_pos(2)+[0:4] ];
plot_labels = {'pH 5.0','pH 6.0','pH 7.0','pH 8.0 *','pH 9.0',...
    '0 mM Mg^{2+}','0.1 mM Mg^{2+}','0.2 mM Mg^{2+}','5 mM Mg^{2+}','10 mM Mg^{2+} *','100 mM Mg^{2+}','no Mg^{2+}, 1 M NaCl','no Mg^{2+}, 2M NaCl',...
    '1/2x 1M7','1/3x 1M7','1/4x 1M7','1/5x 1M7',...
    '5% DMSO','10% DMSO','25% DMSO *','50% DMSO',...
    'pre-bound RT primer','no pre-bound RT primer *',...
    '0 \circC','10 \circC','24 \circC *','37 \circC','50 \circC','65 \circC',...
    'no Mg^{2+}, 0 \circC','no Mg^{2+}, 10 \circC','no Mg^{2+}, 24 \circC','no Mg^{2+}, 37 \circC','no Mg^{2+}, 50 \circC','no Mg^{2+}, 65 \circC','no Mg^{2+}, 80 \circC','no Mg^{2+}, 98 \circC' };
plot_labels = [plot_labels, plot_labels];
set_size = length(highlight_cols)/2;
set_labels = {'1M7 (SHAPE)','no mod'};
xlimits = [100 2500];

sequence_plot = upper(sequence);
make_TOD_electropherogram_heatmap


subplot(2,1,2)
set(gca,'position',[0.07 0.05 0.80 0.40] );
highlight_cols = [0+12+6+[1:5], 36+16+8+[1:8], 84+8+4+[1:4], 120+8+4+[1:4],108+1+6+[1 4],156+8+24+[1:6],204+8+24+[1:8],...
                  0+0+6+[1:5], 36+0+8+[1:8], 84+0+4+[1:4], 120+4+4+[1:4],108+0+6+[1 4],156+0+24+[1:6],204+0+24+[1:8] ];
sequence_plot = strrep(sequence,'AAAAAAAAAAA','AAAAAACAAAA');
make_TOD_electropherogram_heatmap

%export_fig('TOD_expts2_to_7_VarySolutionConditions_Electropherograms_1M7_SI_PAPER_figure.pdf' )