load save_TOD_analysis_expts2_to_8.mat
sequence = upper(sequence);
structure= '......((((((.....))))))...........((((...((((...........))))..((((...........))))..))))...........(((((((....)))))))..........((((((.....))))))......................';


%%
highlight_cols = [0+12+[1:5], 36+16+[1:8], 84+8+[1:4], 120+4+[1:4],108+1+[1 4],156+8+[1:6],204+8+[1:8]];
comments = {'Data on Triangle of Doom test construct for polyA experiments',...
'Sample was SHAPE (1M7) modified under a wide range of solution conditions.',...
'These data report terminations based on capillary electrophoresis of reverse transcribed cDNAs.',...
'Analysis by HITRACE software',...
'Data set acquired by W. Kladwang: 20180313_Ann_TODExp_Pl1_2018-03-13_0195 to 20180320_Ann_TOD_VaryTemp_NoMgCL_2018-03-20_0210'};
comments_with_slippage = [comments,{'NOTE: Due to slippage in transcription and/or reverse transcription at poly(A), sequence assignment is ambiguous at 5 prime end.'}]
annotations = {'experimentType:StandardState','modifier:1M7','processing:overmodificationCorrectionExact','processing:backgroundSubtraction'};
refpos = [ GAGUA_pos(1) + [0:4], GAGUA_pos(2)+[0:4] ];
norm_res = 11:130;
[reactivity,~,reactivity_error] = quick_norm(normalized_reactivity(:,highlight_cols), norm_res, normalized_error(:,highlight_cols) );

plot_labels = {'pH 5.0','pH 6.0','pH 7.0','pH 8.0 *','pH 9.0',...
    '0 mM Mg^{2+}','0.1 mM Mg^{2+}','0.2 mM Mg^{2+}','5 mM Mg^{2+}','10 mM Mg^{2+} *','100 mM Mg^{2+}','no Mg^{2+}, 1 M NaCl','no Mg^{2+}, 2M NaCl',...
    '1/2x 1M7','1/3x 1M7','1/4x 1M7','1/5x 1M7',...
    '5pct DMSO','10pct DMSO','25pct DMSO *','50pct DMSO',...
    'pre-bound RT primer','no pre-bound RT primer *',...
    '0 \circC','10 \circC','24 \circC *','37 \circC','50 \circC','65 \circC',...
    'no Mg^{2+}, 0 \circC','no Mg^{2+}, 10 \circC','no Mg^{2+}, 24 \circC','no Mg^{2+}, 37 \circC','no Mg^{2+}, 50 \circC','no Mg^{2+}, 65 \circC','no Mg^{2+}, 80 \circC','no Mg^{2+}, 98 \circC' };
data_annotations = {};
for i = 1:length( plot_labels ); data_annotations{i} = {'chemical:MgCl2:10mM','chemical:HEPES:50mM(pH8.0)','temperature:24C','chemical:DMSO:25pct'} ; end
data_annotations{1}{2} = 'chemical:Na-MES:50mM(pH5.0)';
data_annotations{2}{2} = 'chemical:Na-MES:50mM(pH6.0)';
data_annotations{3}{2} = 'chemical:Tris-HCl:50mM(pH7.0)';
data_annotations{4}{2} = 'chemical:Na-HEPES:50mM(pH8.0)';
data_annotations{5}{2} = 'chemical:Na-CHES:50mM(pH9.0)';
data_annotations{6}{1} = 'chemical:MgCl2:0mM';
data_annotations{7}{1} = 'chemical:MgCl2:0.1mM';
data_annotations{8}{1} = 'chemical:MgCl2:0.2mM';
data_annotations{9}{1} = 'chemical:MgCl2:5mM';
data_annotations{10}{1} = 'chemical:MgCl2:10mM';
data_annotations{11}{1} = 'chemical:MgCl2:100mM';
data_annotations{12} = [{'chemical:MgCl2:0mM','chemical:NaCl:1M'},data_annotations{12}(2:end)];
data_annotations{13} = [{'chemical:MgCl2:0mM','chemical:NaCl:2M'},data_annotations{13}(2:end)];
data_annotations{14} = [{'modifier:1M7:1/2x'},data_annotations{14}];
data_annotations{15} = [{'modifier:1M7:1/3x'},data_annotations{15}];
data_annotations{16} = [{'modifier:1M7:1/4x'},data_annotations{16}];
data_annotations{17} = [{'modifier:1M7:1/5x'},data_annotations{17}];
data_annotations{18}{4} = 'chemical:DMSO:5pct';
data_annotations{19}{4} = 'chemical:DMSO:10pct';
data_annotations{20}{4} = 'chemical:DMSO:25pct';
data_annotations{21}{4} = 'chemical:DMSO:50pct';
data_annotations{22}{5} = 'chemical:FAM-A20-AAAAAAAAAAAAAAAAAAAAGTTGTTGTTGTTGTTTCTTT';
%data_annotations{23}{5} = 'chemical:FAM-A20-AAAAAAAAAAAAAAAAAAAAGTTGTTGTTGTTGTTTCTTT';
data_annotations{24}{3} = 'temperature:0C';
data_annotations{25}{3} = 'temperature:10C';
data_annotations{26}{3} = 'temperature:24C';
data_annotations{27}{3} = 'temperature:37C';
data_annotations{28}{3} = 'temperature:50C';
data_annotations{29}{3} = 'temperature:65C';
data_annotations{30}{1} = 'chemical:MgCl2:0mM'; data_annotations{30}{3} = 'temperature:0C' ;  
data_annotations{31}{1} = 'chemical:MgCl2:0mM'; data_annotations{31}{3} = 'temperature:10C';
data_annotations{32}{1} = 'chemical:MgCl2:0mM'; data_annotations{32}{3} = 'temperature:24C';
data_annotations{33}{1} = 'chemical:MgCl2:0mM'; data_annotations{33}{3} = 'temperature:37C';
data_annotations{34}{1} = 'chemical:MgCl2:0mM'; data_annotations{34}{3} = 'temperature:50C';
data_annotations{35}{1} = 'chemical:MgCl2:0mM'; data_annotations{35}{3} = 'temperature:65C';
data_annotations{36}{1} = 'chemical:MgCl2:0mM'; data_annotations{36}{3} = 'temperature:80C';
data_annotations{37}{1} = 'chemical:MgCl2:0mM'; data_annotations{37}{3} = 'temperature:98C';

name = 'TOD-S1';
filename = 'RDATS_for_RMDB/TODS1_1M7_0001.rdat';
output_workspace_to_rdat_file( filename, name, sequence, offset, seqpos_out, reactivity, ...
 					       structure, ...
 					       annotations, data_annotations, ...
 					       reactivity_error,[],[],[],comments_with_slippage );
show_rdat( filename )

%%
name = 'TOD-S7';
sequence_plot = strrep(sequence,'AAAAAAAAAAA','AAAAAACAAAA');
[reactivity,~,reactivity_error] = quick_norm(normalized_reactivity(:,highlight_cols), norm_res, normalized_error(:,highlight_cols) );
highlight_cols = [0+12+6+[1:5], 36+16+8+[1:8], 84+8+4+[1:4], 120+8+4+[1:4],108+1+6+[1 4],156+8+24+[1:6],204+8+24+[1:8]];
[reactivity,~,reactivity_error] = quick_norm(normalized_reactivity(:,highlight_cols), norm_res, normalized_error(:,highlight_cols) );
filename = 'RDATS_for_RMDB/TODS7_1M7_0001.rdat';
output_workspace_to_rdat_file( filename, name, sequence_plot, offset, seqpos_out, reactivity, ...
 					       structure, ...
 					       annotations, data_annotations, ...
 					       reactivity_error,[],[],[],comments );
show_rdat( filename )

%%
highlight_cols = [0+2*12+[1:2 4:5], 36+2*16+[1:8], 84+2*8+[1:4], 120+4*4+5+[1:5],108+2+[1 4],156+2*8+[1:7],204+2*8+[1:8]];
comments = {'Data on Triangle of Doom test construct for polyA experiments',...
'Sample was DMS-modified (default: 1pct DMS) under a wide range of solution conditions.',...
'These data report terminations based on capillary electrophoresis of reverse transcribed cDNAs.',...
'Analysis by HITRACE software',...
'Data set acquired by W. Kladwang: 20180313_Ann_TODExp_Pl1_2018-03-13_0195 to 20180320_Ann_TOD_VaryTemp_NoMgCL_2018-03-20_0210'};
comments_with_slippage = [comments,{'NOTE: Due to slippage in transcription and/or reverse transcription at poly(A), sequence assignment is ambiguous at 5 prime end.'}];
annotations = {'experimentType:StandardState','modifier:DMS','processing:overmodificationCorrectionExact','processing:backgroundSubtraction'};
refpos = [ GAGUA_pos(1) + [0:4], GAGUA_pos(2)+[0:4] ];
norm_res = 11:130;
[reactivity,~,reactivity_error] = quick_norm(normalized_reactivity(:,highlight_cols), norm_res, normalized_error(:,highlight_cols) );

plot_labels = {'pH 5.0','pH 6.0','pH 8.0 *','pH 9.0',...
    '0 mM Mg^{2+}','0.1 mM Mg^{2+}','0.2 mM Mg^{2+}','5 mM Mg^{2+}','10 mM Mg^{2+} *','100 mM Mg^{2+}','no Mg^{2+}, 1 M NaCl','no Mg^{2+}, 2M NaCl',...
    '0.125pct DMS','0.25pct DMS','0.5pct DMS','1pct DMS',...
    '0pct DMSO','5pct DMSO','10pct DMSO','25pct DMSO *','50pct DMSO',...
    'pre-bound RT primer','no pre-bound RT primer *',...
    '0 \circC','10 \circC','24 \circC *','37 \circC','50 \circC','65 \circC','80 \circC',...
    'no Mg^{2+}, 0 \circC','no Mg^{2+}, 10 \circC','no Mg^{2+}, 24 \circC','no Mg^{2+}, 37 \circC','no Mg^{2+}, 50 \circC','no Mg^{2+}, 65 \circC','no Mg^{2+}, 80 \circC','no Mg^{2+}, 98 \circC' };
data_annotations = {};
for i = 1:length( plot_labels ); data_annotations{i} = {'chemical:MgCl2:10mM','chemical:HEPES:50mM(pH8.0)','temperature:24C'} ; end
data_annotations{1}{2} = 'chemical:Na-MES:50mM(pH5.0)';
data_annotations{2}{2} = 'chemical:Na-MES:50mM(pH6.0)';
data_annotations{3}{2} = 'chemical:Na-HEPES:50mM(pH8.0)';
data_annotations{4}{2} = 'chemical:Na-CHES:50mM(pH9.0)';
data_annotations{5}{1} = 'chemical:MgCl2:0mM';
data_annotations{6}{1} = 'chemical:MgCl2:0.1mM';
data_annotations{7}{1} = 'chemical:MgCl2:0.2mM';
data_annotations{8}{1} = 'chemical:MgCl2:5mM';
data_annotations{9}{1} = 'chemical:MgCl2:10mM';
data_annotations{10}{1} = 'chemical:MgCl2:100mM';
data_annotations{11} = [{'chemical:MgCl2:0mM','chemical:NaCl:1M'},data_annotations{11}(2:end)];
data_annotations{12} = [{'chemical:MgCl2:0mM','chemical:NaCl:2M'},data_annotations{12}(2:end)];
data_annotations{13} = [{'modifier:DMS:0.125pct'},data_annotations{13}];
data_annotations{14} = [{'modifier:DMS:0.25pct'},data_annotations{14}];
data_annotations{15} = [{'modifier:DMS:0.5pct'},data_annotations{15}];
data_annotations{16} = [{'modifier:DMS:1pct'},data_annotations{16}];
data_annotations{17}{4} = 'chemical:DMSO:0pct';
data_annotations{18}{4} = 'chemical:DMSO:5pct';
data_annotations{19}{4} = 'chemical:DMSO:10pct';
data_annotations{20}{4} = 'chemical:DMSO:25pct';
data_annotations{21}{4} = 'chemical:DMSO:50pct';
data_annotations{22}{4} = 'chemical:FAM-A20-AAAAAAAAAAAAAAAAAAAAGTTGTTGTTGTTGTTTCTTT'; data_annotations{22}{5}='warning:badQuality';
%data_annotations{23}{4} = 'chemical:FAM-A20-AAAAAAAAAAAAAAAAAAAAGTTGTTGTTGTTGTTTCTTT';
data_annotations{24}{3} = 'temperature:0C';
data_annotations{25}{3} = 'temperature:10C';
data_annotations{26}{3} = 'temperature:24C';
data_annotations{27}{3} = 'temperature:37C';
data_annotations{28}{3} = 'temperature:50C';
data_annotations{29}{3} = 'temperature:65C';
data_annotations{30}{3} = 'temperature:80C'; data_annotations{30}{4}='warning:badQuality';
data_annotations{31}{1} = 'chemical:MgCl2:0mM'; data_annotations{31}{3} = 'temperature:0C' ;  
data_annotations{32}{1} = 'chemical:MgCl2:0mM'; data_annotations{32}{3} = 'temperature:10C';
data_annotations{33}{1} = 'chemical:MgCl2:0mM'; data_annotations{33}{3} = 'temperature:24C';
data_annotations{34}{1} = 'chemical:MgCl2:0mM'; data_annotations{34}{3} = 'temperature:37C';
data_annotations{35}{1} = 'chemical:MgCl2:0mM'; data_annotations{35}{3} = 'temperature:50C';
data_annotations{36}{1} = 'chemical:MgCl2:0mM'; data_annotations{36}{3} = 'temperature:65C';
data_annotations{37}{1} = 'chemical:MgCl2:0mM'; data_annotations{37}{3} = 'temperature:80C';
data_annotations{38}{1} = 'chemical:MgCl2:0mM'; data_annotations{38}{3} = 'temperature:98C';

name = 'TOD-S1';
filename = 'RDATS_for_RMDB/TODS1_DMS_0001.rdat';
output_workspace_to_rdat_file( filename, name, sequence, offset, seqpos_out, reactivity, ...
 					       structure, ...
 					       annotations, data_annotations, ...
 					       reactivity_error,[],[],[],comments_with_slippage );
show_rdat( filename )

%%
name = 'TOD-S7';
sequence_plot = strrep(sequence,'AAAAAAAAAAA','AAAAAACAAAA');
[reactivity,~,reactivity_error] = quick_norm(normalized_reactivity(:,highlight_cols), norm_res, normalized_error(:,highlight_cols) );
highlight_cols = [0+2*12+6+[1:2 4:5], 36+2*16+8+[1:8], 84+2*8+4+[1:4], 120+4*4+5+10+[1:5],108+2+6+[1 4],156+2*8+24+[1:7],204+2*8+24+[1:8]];
[reactivity,~,reactivity_error] = quick_norm(normalized_reactivity(:,highlight_cols), norm_res, normalized_error(:,highlight_cols) );
filename = 'RDATS_for_RMDB/TODS7_DMS_0001.rdat';
data_annotations{22} = data_annotations{22}(1:4);
data_annotations{30} = data_annotations{30}(1:3);
output_workspace_to_rdat_file( filename, name, sequence_plot, offset, seqpos_out, reactivity, ...
 					       structure, ...
 					       annotations, data_annotations, ...
 					       reactivity_error,[],[],[],comments );
show_rdat( filename )


%%
% RTase variation
RT_order = [7,8,1,3,4,2,6,5];
RT_labels = {'SuperScriptII','SuperScriptII(Mn2+)','SuperScriptIII','SuperScriptIV','TGIRT','Marathon','AMV','MMLV'};
set_labels = {'1M7 (SHAPE)','no mod'};

name = 'TOD-S1';
comments = {'Data on Triangle of Doom test construct for polyA experiments',...
'Sample was treated with 1M7, and then reverse transcribed in 8 distinct conditions (SuperScript II w/o and w/ Mn2+; SuperScript III, SuperScript IV, TGIRT, Marathon, AMV, or MMLV)',...
'These data report terminations based on capillary electrophoresis of reverse transcribed cDNAs.',...
'Analysis by HITRACE software',...
'Data set acquired by W. Kladwang: 20180326_Ann_Vary_RT_2018-03-26_0211'};
annotations = {'experimentType:StandardState','chemical:MgCl2:10mM','chemical:HEPES:50mM(pH8.0)','temperature:24C','modifier:1M7','processing:overmodificationCorrectionExact','processing:backgroundSubtraction'};

highlight_cols = 252+[8+RT_order]; % 1M7
reactivity = normalized_reactivity(:,highlight_cols);
reactivity_error = normalized_error(:,highlight_cols);
data_annotations = {};
for n = 1:8; data_annotations{n} = { sprintf('reverse_transcriptase:%s',RT_labels{RT_order(n)} ) }; end
comments_with_slippage = [comments,{'NOTE: Due to slippage in transcription and/or reverse transcription at poly(A), sequence assignment is ambiguous at 5 prime end.'}]

filename = 'RDATS_for_RMDB/TODS1_1M7_0002.rdat';
output_workspace_to_rdat_file( filename, name, sequence, offset, seqpos_out, reactivity, ...
 					       structure, ...
 					       annotations, data_annotations, ...
 					       reactivity_error,[],[],[],comments_with_slippage );
show_rdat( filename )

%%
sequence_plot = strrep(sequence,'AAAAAAAAAAA','AAAAAACAAAA');
name = 'TOD-S7';
highlight_cols = 252+[24+RT_order]; % 1M7
reactivity = normalized_reactivity(:,highlight_cols);
reactivity_error = normalized_error(:,highlight_cols);
filename = 'RDATS_for_RMDB/TODS7_1M7_0002.rdat';
output_workspace_to_rdat_file( filename, name, sequence_plot, offset, seqpos_out, reactivity, ...
 					       structure, ...
 					       annotations, data_annotations, ...
 					       reactivity_error,[],[],[],comments );
show_rdat( filename )


