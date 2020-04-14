filenames = { ...
    '12) 110718_TOD_S1_S7_156_57_41/110718_TOD_S1_S7_156_57_41_Elim_565280_41only',...
    '121118_TOD work/TOD-Synnthesized-S1-41/CE data-TOD-Synnthesized-S1-41/121018_SynS1_41_NM',... 
    '121318_TOD_Syn_41_vary_RT/CE data/121318_CE data',...
    '121318_TOD_Syn_41_vary_RT/CE data/121918_TOD_Syn41_SSIII_TG_Elim_569630',...
    '121318_TOD_Syn_41_vary_RT/CE data/122018_TOD_Syn41_TG_Elim_569875',...    
     }
[d, d_ref, ylim, labels ] = quick_look( filenames );

d_align = d;
sequence = 'GGGUACAAAAAAAAAAAGUACAAAGAAACAACAACAACAAC'
structure= '..((((...........))))....................'

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


offset = 0;
first_RT_nucleotide = length(sequence) - 20 + offset;
if ~exist( 'xsel', 'var' ); xsel = []; clf; end;
[xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);

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




