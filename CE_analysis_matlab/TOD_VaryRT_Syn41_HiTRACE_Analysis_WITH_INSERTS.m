filenames = { ...
    '12) 110718_TOD_S1_S7_156_57_41/110718_TOD_S1_S7_156_57_41_Elim_565280_41only',...
    '121118_TOD work/TOD-Synnthesized-S1-41/CE data-TOD-Synnthesized-S1-41/121018_SynS1_41_NM',... 
    '121318_TOD_Syn_41_vary_RT/CE data/121318_CE data',...
    '121318_TOD_Syn_41_vary_RT/CE data/121918_TOD_Syn41_SSIII_TG_Elim_569630',...
    '121318_TOD_Syn_41_vary_RT/CE data/122018_TOD_Syn41_TG_Elim_569875',...    
     }
[d, d_ref, ylim, labels ] = quick_look( filenames, [948:2000] );
%load TOD_VaryRT_Syn41_HiTRACE_Analysis.mat

%%
d_align = d;
sequence = 'NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGGGUACAAAAAAAAAAAGUACAAAGAAACAACAACAACAAC';
structure= '................................((((...........))))....................';

% set data types based on Ann's labels (1M7, DMS, nomod)
data_types = {'nomod','nomod','DMS','DMS','1M7','1M7','nomod','nomod','DMS','DMS','1M7','1M7'}; % 110718 
for i = 1:11; data_types_m1Apos{i} = num2str(18-i); end
data_types = [data_types,'nomod',data_types_m1Apos ]; % 121118 nomod 

data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 SSII
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 SSIII
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 SSIV
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 TGIRT
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 Marathon
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 MMLV
% dilute:
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 SSII
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 SSIII
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 SSIV
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 TGIRT
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 Marathon
data_types = [data_types,'nomod',data_types_m1Apos,'nomod','nomod' ]; % 121318 MMLV

data_types = [data_types,'nomod',data_types_m1Apos ]; % 121918 SSIII
data_types = [data_types,'nomod',data_types_m1Apos ]; % 121918 TGIRT
data_types = [data_types,'nomod',data_types_m1Apos ]; % 121918 SSIII -dil
data_types = [data_types,'nomod',data_types_m1Apos ]; % 121918 TGIRT -dil

data_types = [data_types,'nomod',data_types_m1Apos,'nomod' ]; % 122018 TGIRT-pH8
data_types = [data_types,'nomod',data_types_m1Apos,'nomod' ]; % 122018 TGIRT-pH7

data_types = [data_types,'nomod',data_types_m1Apos,'nomod' ]; % 122018 TGIRT-pH8
data_types = [data_types,'nomod',data_types_m1Apos,'nomod' ]; % 122018 TGIRT-pH7
length( data_types )


offset = -1 * max(strfind( sequence, 'N' ));
first_RT_nucleotide = length(sequence) - 20 + offset;
if ~exist( 'xsel', 'var' ); xsel = []; clf; end;
[xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);

%%
[area_peak, darea_peak] = fit_to_gaussians(d_align, xsel);

figure(3)
ref_peak = []; % no additional normalization
sd_cutoff = 1.5;
saturated_idx = [1:292 ];
diluted_idx = saturated_idx; % see next for diulations =(
diluted_idx(7:12) = [1:6];
diluted_idx(25:108) = [109:192];
diluted_idx(193:216) = [217:240];
diluted_idx(241:266) = [267:292];
saturated_array = area_peak(:, saturated_idx);
saturated_error = darea_peak (:, saturated_idx);

diluted_array = area_peak(:, diluted_idx);
diluted_error = darea_peak (:, diluted_idx);
bkg_col  = saturated_idx*0; % no background subtraction
%bkg_col(1:12)  = [1:2, 1:2, 1:2,1:2, 1:2, 1:2]

[normalized_reactivity, normalized_error, seqpos_out] = get_reactivities(saturated_array, diluted_array, saturated_error, diluted_error, bkg_col, [], seqpos, [], data_types(saturated_idx), sequence, offset, sd_cutoff);


%%
% prepare RDAT for output
% set data types based on Ann's labels (1M7, DMS, no mod)
undiluted_idx = [178+[1:12], 108+[1:12], 122+[1:12],136+[1:12], 164+[1:12],279+[1:12]];
set_labels = {'MMLV','SuperScriptII','SuperScriptIII','SuperScriptIV','TGIRT','Marathon'}; %,'SuperScript III\newline       repeat','TGIRT\newlinerepeat','TGIRT,\newlinepH 8.0','TGIRT,\newlinepH 7.0'};
name = 'Syn41 polyadenosine model RNA';
comments = {'Data on Syn41 (synthetic 41-nucleotide RNA) for polyA experiments',...
    'cDNA products that extend beyond the beginning of the RNA correspond to N sequences prepended to RNA sequence.',...
    'Sample was prepared through chemical synthesis with m1A installed at specific positions, marked as mutation X in DATA_ANNOTATION fields.',...
    'These data report terminations as read out through capillary electrophoresis, with no corrections for attenuation or overmodification.',...
    'Data are not normalized.',...
    'Data set acquired by W. Kladwang: 121018_SynS1_41_NM, 121318_TOD_Syn_41_vary_RT'};
annotations = {'experimentType:StandardState'};

%sums = sum(area_peak(:,undiluted_idx ),2);
%reactivity = area_peak(:,undiluted_idx )./repmat( sums,1, length(undiluted_idx));
%reactivity_error = darea_peak(:,undiluted_idx )./repmat( sums,1, length(undiluted_idx));

reactivity = area_peak(:,undiluted_idx );
reactivity_error = darea_peak(:,undiluted_idx );

i = 0;
for j =1:length( set_labels )
    for n = 1:12;
        i = i+1;
        data_annotations{i} = { sprintf('reverse_transcriptase:%s',set_labels{j} ) };
        k = str2num(data_types{undiluted_idx(i)});
        if ~isempty( k )
            data_annotations{i}{2} = sprintf('mutation:A%dX',k);
            endu
    end
end


filename = 'RDATS_for_RMDB/SYN41_M1A_0001.rdat';
output_workspace_to_rdat_file( filename, name, sequence, offset, seqpos, reactivity, ...
 					       structure, ...
 					       annotations, data_annotations, ...
 					       reactivity_error,[],[],[],comments );
show_rdat( filename )


