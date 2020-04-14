%%
% load save_TOD_analysis_expts2_to_8
%%
figure(4); clf;
set(gcf,'position',[200 800 600 650]);

display_array = normalized_reactivity;
%display_array = area_peak(2:end,saturated_idx);
GAGUA_pos = strfind( sequence, 'GAGUA' ); % 13 133


subplot(1,1,1)
% 1M7
set(gca,'position',[0.07 0.1 0.60 0.84] );
highlight_cols = [0+12+[1:5], 36+16+[1:8], 84+8+[1:4], 120+4+[1:4],108+1+[1 4],156+8+[1:6],204+8+[1:8]]; % 1M7
    
%plot_labels = labels(saturated_idx(highlight_cols));
refpos = [ GAGUA_pos(1) + [0:4], GAGUA_pos(2)+[0:4] ];
plot_labels = {'pH 5.0','pH 6.0','pH 7.0','pH 8.0 *','pH 9.0',...
               '0 mM Mg^{2+}','0.1 mM Mg^{2+}','0.2 mM Mg^{2+}','5 mM Mg^{2+}','10 mM Mg^{2+} *','100 mM Mg^{2+}','no Mg^{2+}, 1 M NaCl','no Mg^{2+}, 2M NaCl',...
               '1/2x 1M7','1/3x 1M7','1/4x 1M7','1/5x 1M7',...
               '5% DMSO','10% DMSO','25% DMSO *','50% DMSO',...
               'pre-bound RT primer','no pre-bound RT primer *',...
               '0 \circC','10 \circC','24 \circC *','37 \circC','50 \circC','65 \circC',...
               'no Mg^{2+}, 0 \circC','no Mg^{2+}, 10 \circC','no Mg^{2+}, 24 \circC','no Mg^{2+}, 37 \circC','no Mg^{2+}, 50 \circC','no Mg^{2+}, 65 \circC','no Mg^{2+}, 80 \circC','no Mg^{2+}, 98 \circC' };
 
make_TOD_expt_subplot
xlabel('RNA sequence position')
%set(gca,'xtick',[])
%text(minres-6,0,'A','fontsize',60,'fontweight','normal');

% DMS
figure(5); clf;
set(gcf,'position',[250 850 600 650]);
set(gca,'position',[0.07 0.1 0.60 0.84] );
highlight_cols = [0+2*12+[1:2 4:5], 36+2*16+[1:8], 84+2*8+[1:4], 120+4*4+5+[1:5],108+2+[1 4],156+2*8+[1:6],204+2*8+[1:8]] ; % DMS
plot_labels = {'pH 5.0','pH 6.0','pH 8.0 *','pH 9.0',...
               '0 mM Mg^{2+}','0.1 mM Mg^{2+}','0.2 mM Mg^{2+}','5 mM Mg^{2+}','10 mM Mg^{2+} *','100 mM Mg^{2+}','no Mg^{2+}, 1 M NaCl','no Mg^{2+}, 2M NaCl',...
               '0.125% DMS','0.25% DMS','0.5% DMS','1% DMS',...
               '0% DMSO','5% DMSO','10% DMSO','25% DMSO *','50% DMSO',...
               'pre-bound RT primer','no pre-bound RT primer *',...
               '0 \circC','10 \circC','24 \circC *','37 \circC','50 \circC','65 \circC',...
               'no Mg^{2+}, 0 \circC','no Mg^{2+}, 10 \circC','no Mg^{2+}, 24 \circC','no Mg^{2+}, 37 \circC','no Mg^{2+}, 50 \circC','no Mg^{2+}, 65 \circC','no Mg^{2+}, 80 \circC','no Mg^{2+}, 98 \circC' };
refpos = [ GAGUA_pos(1) + [1 4], GAGUA_pos(2)+[1 4] ];
make_TOD_expt_subplot
%text(minres-6,0,'B','fontsize',60,'fontweight','normal');
