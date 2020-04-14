load TOD_VaryRT_Syn41_HiTRACE_Analysis.mat
% Heatmap of raw capillary electropherogram for Supplemental Figures

% set data types based on Ann's labels (1M7, DMS, no mod)
data_labels = {'no mod','no mod','DMS','DMS','1M7','1M7','no mod','no mod','DMS','DMS','1M7','1M7'}; % 110718 
for i = 1:11; data_labels_m1Apos{i} = sprintf( 'm1A at %d',-i ); end
data_labels = [data_labels,'no mod',data_labels_m1Apos ]; % 121118 no mod 

data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 SSII
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 SSIII
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 SSIV
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 TGIRT
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 Marathon
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 MMLV
% dilute:
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 SSII
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 SSIII
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 SSIV
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 TGIRT
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 Marathon
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod','no mod' ]; % 121318 MMLV

data_labels = [data_labels,'no mod',data_labels_m1Apos ]; % 121918 SSIII
data_labels = [data_labels,'no mod',data_labels_m1Apos ]; % 121918 TGIRT
data_labels = [data_labels,'no mod',data_labels_m1Apos ]; % 121918 SSIII -dil
data_labels = [data_labels,'no mod',data_labels_m1Apos ]; % 121918 TGIRT -dil

data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod' ]; % 122018 TGIRT-pH8
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod' ]; % 122018 TGIRT-pH7

data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod' ]; % 122018 TGIRT-pH8
data_labels = [data_labels,'no mod',data_labels_m1Apos,'no mod' ]; % 122018 TGIRT-pH7


% copied from TOD_VaryRT_Syn41_HiTRACE_Analysis
%set(figure(1),'Position',[ 197         239         799        1106]);
set(figure(1),'Position',[ 197         239         469        1106]);
clf;
%undiluted_idx = [108+[1:12], 122+[1:12],136+[1:12],150+[1:12], 164+[1:12],178+[1:12], 216+[1:12],228+[1:12], 266+[1:12],279+[1:12]];
undiluted_idx = [178+[1:12], 108+[1:12], 122+[1:12],136+[1:12], 164+[1:12],279+[1:12]];
image( 20*d_align(:, undiluted_idx )' );
set(gcf, 'PaperPositionMode','auto','color','white');
colormap( 1-gray(100));
set(gca,'yticklabel', data_labels( undiluted_idx ),'ytick',[1:length(undiluted_idx)] );
make_lines_horizontal()
set(gca,'xlim',[150 500]);
%find( mod(seqpos,10) == 0 );
%set(gca,'xtick', xsel(2:end), 'xticklabel', sequence(seqpos_out-offset)' );
hold on
for i = 2:length( xsel )
    text( xsel(i),0,sequence(seqpos(i)),'verticalalign','bottom','horizontalalign','center','fontweight','bold','fontsize',9 );
end
text( xsel(1),0,'fully\newlineextended','rotation',90,'verticalalign','bottom','fontsize',9);
for i = 1:11; 
    pos = 18-i;
    text( xsel(find(seqpos == pos)),-1.0,num2str(-i),...
        'verticalalign','bottom','horizontalalign','center','fontweight','bold' ,'fontsize',8);
end


%set_labels = {'SuperScript II','SuperScript III','SuperScript IV','TGIRT','Marathon','MMLV','SuperScript III\newline       repeat','TGIRT\newlinerepeat','TGIRT,\newlinepH 8.0','TGIRT,\newlinepH 7.0'};
set_labels = {'MMLV','SuperScript II','SuperScript III','SuperScript IV','TGIRT','Marathon'}; %,'SuperScript III\newline       repeat','TGIRT\newlinerepeat','TGIRT,\newlinepH 8.0','TGIRT,\newlinepH 7.0'};
for i = 1:length( set_labels )
    text(505,6+12*(i-1),set_labels{i},'horizontalalign','right','fontsize',14);
end
    
set( gca,'xdir','reverse','yaxisloc','right','xtick',[] );
set(gca,'position',[0.3 0.05 0.5 0.9]);
set(gca,'fontweight','bold' );
make_lines_horizontal( [0:12:10*12],'k',2);
xlabel( 'Electrophoresis direction' );

%%%export_fig( 'TOD_VaryRT_Syn41_HiTRACE_MAINTEXT_PAPER.pdf' );
%%%export_fig( 'TOD_VaryRT_Syn41_HiTRACE_SI_PAPER.png','-r300' );
%print( 'TOD_VaryRT_Syn41_HiTRACE_MAINTEXT_PAPER.pdf','-bestfit','-dpdf' );

