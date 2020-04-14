if ~exist( 'structure_images','dir') mkdir( 'structure_images/' ); end;
%% SHAPE
r = read_rdat_file( 'POLYA_1M7_000000.rdat' );
for i = 1:size( r.reactivity,2);    
    d = -999*ones(length(r.sequence),1);
    d( r.seqpos ) = r.reactivity(:,i);
    badpoints = find( r.reactivity(:,i) > 0.2 & r.reactivity_error(:,i) > 0.5*r.reactivity(:,i) );
    d( r.seqpos(badpoints) ) = -999;
    output_varna( sprintf('structure_images/TOD_S1_ext%d_CE_1M7.eps',i),upper(r.sequences{i}),r.structures{i},'','',offset,[],[],d);
end

%% DMS
r = read_rdat_file( 'POLYA_DMS_000000.rdat' );
for i = 1:size( r.reactivity,2);    
    d = -999*ones(length(r.sequence),1);
    d( r.seqpos ) = r.reactivity(:,i);
    badpoints = find( r.reactivity(:,i) > 0.2 & r.reactivity_error(:,i) > 0.5*r.reactivity(:,i) );
    d( r.seqpos(badpoints) ) = -999;
    output_varna( sprintf('structure_images/TOD_S1_ext%d_CE_DMS.eps',i),upper(r.sequences{i}),r.structures{i},'','',offset,[],[],d);
end

