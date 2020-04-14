%%
expts2to8 = load( 'save_TOD_analysis_expts2_to_8.mat' )
%offset = -29; % hmm, should we really do this?
offset = 0;
%SHAPE
output_varna( 'structure_images/TOD_S1_CE_1M7.eps',upper(expts2to8.sequence),expts2to8.structure,'','',offset,[],[],expts2to8.normalized_reactivity(:,13)*80);
%DMS
output_varna( 'structure_images/TOD_S1_CE_DMS.eps',upper(expts2to8.sequence),expts2to8.structure,'','',offset,[],[],expts2to8.normalized_reactivity(:,25)*40);

%%
r_mutprof = read_rdat_file( 'RDATs/TOD.S1.mut.ALL.rdat' )

%
%
% need to include mutational profiling.
%
%
SSII_Mn_profiles = r_mutprof.reactivity(:,2+[0:8:24])  - repmat(r_mutprof.reactivity(:,2+[0]),1,4);
%SHAPE
output_varna( 'structure_images/TOD_S1_MutProf_1M7.eps',upper(r_mutprof.sequence),expts2to8.structure,'','',offset,[],[],SSII_Mn_profiles(:,3)*800);
%DMS
output_varna( 'structure_images/TOD_S1_MutProf_DMS.eps',upper(r_mutprof.sequence),expts2to8.structure,'','',offset,[],[],SSII_Mn_profiles(:,4)*400);


%%
% for shorter construct.
load TOD_VaryRT_Syn41_HiTRACE_Analysis
output_varna( 'structure_images/Syn41_DMS.eps',sequence,structure,'','',offset,[],[],DMS_profile(:,2)*40);
%output_varna( 'structure_images/Syn41_DMS.eps',sequence,structure(1:24),'','',offset,1:24,[],DMS_profile(:,2)*40);