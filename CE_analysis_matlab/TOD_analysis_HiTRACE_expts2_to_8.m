dirnames = {...
'2) TOD varypH/CE data',...
'3) TOD VaryMg/CE data',...
'4) TOD vary Modifier/CE data',...
'5) TOD Tail2 to block 3end/CE data',...
'6) TOD_VaryDMSO/CE data',...
'7) TOD_Vary Temp/CE data',...
'8) TOD_Vary RTase/CE data',...
}

[d,da,ylim,labels]  = quick_look( dirnames, [2401 5200] );

%align_blocks = {1:4, 5:6, 7:8};
%d_align_before_more_alignment = d_align;
%d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
%d_align = d_align_dp_fine;
d_align = d;

sequence = 'GGAAAAGGCGUCGAGUAGACGCCAACAACGGAAAccugAAAGAUCAAAAAAAAAAAGAUCAAGUACAAAAAAAAAAAGUACAAcaggAAAAAAAAAAAGCAUAGGUUCGCCUAUGCAAACCAAACCGUCAGCGAGUAGCUGACAAAAAGAAACAACAACAACAAC'
structure= '......((((((.....))))))...........((((...((((...........))))..((((...........))))..))))...........(((((((....))))))).........(((((((.....)))))).....................';

% set data types based on Ann's labels (1M7, DMS, nomod)
for i = 1:size(d,2)
    if ~isempty(strfind(labels{i},'nomod')) | ~isempty(strfind(labels{i},'NM'))
        data_types{i} = 'nomod';
    elseif ~isempty(strfind(labels{i},'1M7'))
        data_types{i} = '1M7';
    elseif ~isempty(strfind(labels{i},'DMS'))
        data_types{i} = 'DMS';
    else
        fprintf( 'Unrecognized label %s\n', labels{i} );
        data_types{i} = 'nomod';
    end
end

offset = 0;
first_RT_nucleotide = length(sequence) - 20 + offset;
if ~exist( 'xsel', 'var' ); xsel = []; clf; end;
[xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);
[area_peak, darea_peak] = fit_to_gaussians(d_align, xsel);

%%
% '2) TOD varypH/CE data',...  1-36 (6x2x3)
% '3) TOD VaryMg/CE data',...  37-84 (8x2x3) 
% '4) TOD vary Modifier/CE data',...  85-108 (4x2x3)
% '5) TOD Tail2 to block 3end/CE data',... 109-120 (2x2x3, note unusual
% order)
% '6) TOD_VaryDMSO/CE data',... 121-156 (4x2x2 + 5x2x2)
% '7) TOD_Vary Temp/CE data',... 157-204 
% '8) TOD_Vary RTase/CE data',...

figure(3)
ref_segment = 'GAGUA';
ref_peak = get_ref_peak(sequence, ref_segment, offset);
sd_cutoff = 1.5;
saturated_idx = [1:36, 37:84, 85:108, 108+[1:12], 120+[1:36], 156+[1:48], 204+[1:48], 252+[1:32] ];
diluted_idx = saturated_idx; % looks like we did not run a separate diluted data set. =(
saturated_array = area_peak(:, saturated_idx);
saturated_error = darea_peak (:, saturated_idx);
diluted_array = area_peak(:, diluted_idx);
diluted_error = darea_peak (:, diluted_idx);
bkg_col  = [1:12 1:12 1:12, 37:52 37:52 37:52, 85:92 85:92 85:92, 108+[1:3:12,1:3:12,1:3:12], ...
    120+[1:4,1:4,9:12,9:12,17:21,17:21,27:31,27:31], 156+[1:8,1:8,1:8,25:32,25:32,25:32], 204+[1:8,1:8,1:8,25:32,25:32,25:32],...
    252+[1:8,1:8,17:24,17:24]];

[normalized_reactivity, normalized_error, seqpos_out] = get_reactivities(saturated_array, diluted_array, saturated_error, diluted_error, bkg_col, [], seqpos, [], data_types(saturated_idx), sequence, offset, sd_cutoff);

