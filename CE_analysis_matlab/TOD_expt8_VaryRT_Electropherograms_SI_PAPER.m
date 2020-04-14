load save_TOD_analysis_expts2_to_8.mat

set(figure(1),'Position',[ 77         556        1819         399]); clf;

xlimits = [100 2500];
RT_order = [7,8,1,3,4,2,6,5];
RT_labels = {'SuperScript II','SuperScript II (Mn^{2+})','SuperScript III','SuperScript IV','TGIRT','Marathon','AMV','MMLV'};
plot_labels = RT_labels( RT_order );
plot_labels = [plot_labels, plot_labels];
set_size = 8;
set_labels = {'1M7 (SHAPE)','no mod'};

subplot(2,1,1);
set(gca,'pos',[0.05 0.55 0.9 0.4]);
sequence_plot = sequence;
highlight_cols = 252+[8+RT_order, 0+RT_order]; % 1M7
make_TOD_electropherogram_heatmap;

subplot(2,1,2);
set(gca,'pos',[0.05 0.05 0.9 0.4]);
sequence_plot = strrep(sequence,'AAAAAAAAAAA','AAAAAACAAAA');
highlight_cols = 252+[24+RT_order, 16+RT_order]; % 1M7
make_TOD_electropherogram_heatmap;

%export_fig( 'TOD_expt8_VaryRT_Electropherogram_SI_PAPER.pdf' );


