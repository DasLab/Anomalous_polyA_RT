figure(6)
clf;
set(gcf,'position',[200 800 600 200]);

display_array = normalized_reactivity;
%display_array = area_peak(2:end,saturated_idx);
GAGUA_pos = strfind( sequence, 'GAGUA' ); % 13 133

subplot(1,1,1)
% 1M7
set(gca,'position',[0.07 0.25 0.60 0.56] );
RT_order = [7,8,1,3,4,2,6,5];
highlight_cols = [252+8+RT_order]; % 1M7
%plot_labels = labels(saturated_idx(highlight_cols));
refpos = [ GAGUA_pos(1) + [0:4], GAGUA_pos(2)+[0:4] ];
RT_labels = {'SuperScript II','SuperScript II (Mn^{2+})','SuperScript III','SuperScript IV','TGIRT','Marathon','AMV','MMLV'};
plot_labels = RT_labels( RT_order )
make_TOD_expt_subplot
