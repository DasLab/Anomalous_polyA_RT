figure(6)
clf;
set(gcf,'position',[200 800 800 300]);

display_array = normalized_reactivity;
subplot(1,2,1)
% 1M7
set(gca,'position',[0.05 0.25 0.43 0.60 ] );
highlight_cols = [123:134]; % SSIII
% [217:228]; % SSIII
refpos = [];
plot_labels = {'Syn','m^1A -1','m^1A -2','m^1A -3','m^1A -4','m^1A -5','m^1A -6','m^1A -7','m^1A -8','m^1A -9','m^1A -10','m^1A -11'};
minres = 1;
maxres = length(sequence)-20;
make_TOD_expt_subplot
text(minres-6,0,'A','fontsize',40,'fontweight','normal');

subplot(1,2,2)
% Let's also compute vals and show a bar graph or something -- smoe kind of
% quantitative comparison.
mod_cols = [124:134];
mod_pos = [-1:-1:-11];
for i = 1:length( mod_cols )
    stop_prob(i) = sum(normalized_reactivity( 18 + mod_pos(i) + [0], mod_cols(i) )); % at stop position    
    %stop_profiles(:,i) = normalized_reactivity( 18 + [-11:-1], mod_cols(i) ); % takes into account that RT might stop 'later' after modification.
end

% allow 'next' col to be included.
%for i = find( mod_pos == -6 )
%    stop_prob(i+1) = stop_prob(i+1) + sum(normalized_reactivity( 18 + mod_pos(i) + [-1], mod_cols(i) )); % at stop position    
%end

% quantitative overlay 
%plot( mod_pos, stop_prob,'linew',2) ; hold on
%%plot( mod_pos, 0.5*sum(stop_profiles)); 
%%plot( mod_pos, stop_profile); 

% DMS data -- actually available on disk.
DMS_col = 3;
DMS_profile = normalized_reactivity(:,[3 9]) - normalized_reactivity(:,1 );
%plot( [-11:-1], DMS_profile(18+[-11:-1],:)*80,'ko','markerfacecolor','k' );

% let's also load in DMS data from full-length TOD.
TODexpts2to8 = load( 'save_TOD_analysis_expts2_to_8.mat', 'normalized_reactivity' );
% taken directly from TOD_expts2_to_7_VarySolutionConditions_PAPER_figure.m
TODexpts2to8_DMS_highlight_cols = [0+2*12+[1:2 4:5], 36+2*16+[1:8], 84+2*8+[1:4], 108+2*4+[1:2],120+4*4+5+[1:5],156+2*8+[1:6],204+2*8+[1:8]] ; % DMS
TODexpts2to8_DMS_norm = quick_norm( TODexpts2to8.normalized_reactivity( :, TODexpts2to8_DMS_highlight_cols ), 11:130);
%plot( [-11:-1], TODexpts2to8_DMS_norm( 88:98,:)* 0.2 ,'k.' )

set(gca,'position',[0.65 0.25 0.3 0.60] );
b = bar( -11:-1, [stop_prob(end:-1:1)', DMS_profile(18+[-11:-1],1)*80] );
b(1).FaceColor = 'k';
b(2).FaceColor = 'w';
axis([-12 0 0 1.5]);
set(gca,'fontweight','bold','fontsize',12);
xlabel('position of modified A')
h =legend( 'm^1A stop probability','DMS signal','location','northwest');
set(h,'fontsize',9)
%text(-15,1.5,'B','fontsize',40,'fontweight','normal');

%export_fig( 'TOD_VaryRT_Syn41_PAPER_figure.pdf' );