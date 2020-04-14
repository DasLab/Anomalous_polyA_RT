%-- 11/15/18, 5:23 PM --%
quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15:17, 22:24] )
quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15:21] )
quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15 16 17 35 36 37 18 19 20 21] )
%d = quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15 16 17 35 36 37 18 19 20 21] )
d = quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15 35 16 36 17 37 18 19 20 21] )
align_blocks = {1:2, 3:4, 5:6};
d_align_before_more_alignment = d_align;
[d_align, d_ref_align, ylimit, labels] = quick_look(filenames, ylimit, reorder);
d = quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15 35 16 36 17 37 18 19 20 21] )
[d_align, d_ref_align, ylimit, labels] = quick_look({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15 35 16 36 17 37 18 19 20 21]);
align_blocks = {1:2, 3:4, 5:6};
d_align_before_more_alignment = d_align;
d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
d_align = d_align_dp_fine;
sequence = 'GGGAAAccugAAAGAUCAAAAAAAAAAAGAUCAAGUACAAAAAAAAAAAGUACAAcaggAAAAGAAACAACAACAACAAC';
structure = '......((((...((((...........))))..((((...........))))..)))).....................';
data_types = [ ...
repmat({'nomod'}, 1, 2), repmat({'DMS'}, 1, 2), repmat({'SHAPE'}, 1, 2), repmat({'ddATP'}, 1, 1), repmat({'ddCTP'}, 1, 1), repmat({'ddGTP'}, 1, 1), repmat({'ddTTP'}, 1, 1) ];
offset = -1;
first_RT_nucleotide = length(sequence) - 20 + offset;
xsel = []; clf;
[xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);
first_RT_nucleotide = length(sequence) - 20 + offset;
[area_peak, darea_peak] = fit_to_gaussians(d_align, xsel);
ref_segment = '';
ref_peak = get_ref_peak(sequence, ref_segment, offset);
sd_cutoff = 1.5;
saturated_idx = [1, 3, 5];
diluted_idx = saturated_idx + 1;


--------------
d = quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15 35 16 36 17 37 18 19 20 21] )
align_blocks = {1:2, 3:4, 5:6};


ref_peak = []
sd_cutoff = 1.5;
saturated_idx = [1, 3, 5];
diluted_idx = saturated_idx + 1;
saturated_array = area_peak(:, saturated_idx)
diluted_array = area_peak(:, diluted_idx)
saturated_error = darea_peak(:, saturated_idx)
diluted_error = darea_peak(:, diluted_idx)
                             

bkg_col  = [1, 1, 1];
[normalized_reactivity, normalized_error, seqpos_out] = get_reactivities(saturated_array, diluted_array, saturated_error, diluted_error, bkg_col, ref_peak, seqpos, [], ['nomod', 'dms', '1m7'], sequence, offset, sd_cutoff);



plot(normalized_reactivity(:, 1:3)*50)

[d_DMS_minus, da_DMS_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 2), normalized_error(:, 2), [], seqpos_out, sequence, offset);
[d_1M7_minus, da_1M7_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 3), normalized_error(:, 3), [], seqpos_out, sequence, offset);

11/16/18
%-- 11/16/18, 1:05 PM --% (S1_80_Syn)
            d = quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [15 35 16 36 17 37 18 19 20 21] )
            align_blocks = {1:2, 3:4, 5:6};
            d_align_before_more_alignment = d_align;
            d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
            d_align = d
            d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
            d_align_before_more_alignment = d_align;
            d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
            d_align = d_align_dp_fine;
            sequence = 'GGGAAAccugAAAGAUCAAAAAAAAAAAGAUCAAGUACAAAAAAAAAAAGUACAAcaggAAAAGAAACAACAACAACAAC';
            structure = '......((((...((((...........))))..((((...........))))..)))).....................';
            data_types = [ ...
                          repmat({'nomod'}, 1, 2), repmat({'DMS'}, 1, 2), repmat({'SHAPE'}, 1, 2), repmat({'ddATP'}, 1, 1), repmat({'ddCTP'}, 1, 1), repmat({'ddGTP'}, 1, 1), repmat({'ddTTP'}, 1, 1) ];
            data_types
            offset = -1;
            first_RT_nucleotide = length(sequence) - 20 + offset;
            xsel = []; clf;
            [xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);
            close all
            [xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);
            close all
            save 111618_S1syn_matlab
            [area_peak, darea_peak] = fit_to_gaussians(d_align, xsel);
            ref_peak = [];
            sd_cutoff = 1.5;
            saturated_idx = [1, 3, 5];
            diluted_idx = saturated_idx + 1;
            bkg_col  = [1, 1, 1];
            saturated_array = area_peak(:, saturated_idx)
            saturated_array = area_peak(:, saturated_idx);
            area_peak(:, saturated_idx)
            saturated_array = area_peak(:, saturated_idx)
            diluted_array = area_peak(:, diluted_idx)
            saturated_error = darea_peak(:, saturated_idx)
            diluted_error = darea_peak(:, diluted_idx)
            bkg_col  = [1, 1, 1];
            [normalized_reactivity, normalized_error, seqpos_out] = get_reactivities(saturated_array, diluted_array, saturated_error, diluted_error, bkg_col, ref_peak, seqpos, [], ['nomod', 'dms', '1m7'], sequence, offset, sd_cutoff);
            plot(normalized_reactivity(:, 1:3))
            clf
            plot(normalized_reactivity(:, 1:3))
            plot(normalized_reactivity(:, 1:3))*50
            plot(normalized_reactivity(:, 1:3)*50)
            [d_DMS_minus, da_DMS_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 2), normalized_error(:, 2), [], seqpos_out, sequence, offset);
            [d_DMS_minus, da_DMS_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 2)*20, normalized_error(:, 2)*20, [], seqpos_out, sequence, offset);
            [d_1M7_minus, da_1M7_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 3), normalized_error(:, 3), [], seqpos_out, sequence, offset);
            [d_1M7_minus, da_1M7_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 3)*20, normalized_error(:, 3)*20, [], seqpos_out, sequence, offset);///

11/16/18 (S7_80_Syn)
d_align =quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [22 38  23 39 24 40 25 26 27 28])
% d = quick_look ({'092718_S1S7syn_PAGE_Elim_560327'},[1000, 2100], [22 38  23 39 24 40 25 26 27 28])
align_blocks = {1:2, 3:4, 5:6};
d_align_before_more_alignment = d_align;
d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
d_align = d
d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
d_align_before_more_alignment = d_align;
d_align_dp_fine = align_by_DP_fine(d_align_before_more_alignment, align_blocks);
d_align = d_align_dp_fine;
sequence = 'GGGAAAccugAAAGAUCAAAAAACAAAAGAUCAAGUACAAAAAACAAAAGUACAAcaggAAAAGAAACAACAACAACAAC';
structure = '......((((...((((...........))))..((((...........))))..)))).....................';
data_types = [repmat({'nomod'}, 1, 2), repmat({'DMS'}, 1, 2), repmat({'SHAPE'}, 1, 2), repmat({'ddATP'}, 1, 1), repmat({'ddCTP'}, 1, 1), repmat({'ddGTP'}, 1, 1), repmat({'ddTTP'}, 1, 1) ];
data_types
offset = -2;
first_RT_nucleotide = length(sequence) - 20 + offset;
xsel = []; clf;
[xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);
%Note: esc then x = auto assign
%Note: esc then q = auto save
% clf = clear figure

close all
[xsel, seqpos, area_pred] = annotate_sequence(d_align, xsel, sequence, offset, data_types, first_RT_nucleotide, structure);


%

close all
save 111618_S1syn_matlab
[area_peak, darea_peak] = fit_to_gaussians(d_align, xsel);
ref_peak = [];
sd_cutoff = 1.5;
saturated_idx = [1, 3, 5];
diluted_idx = saturated_idx + 1;
bkg_col  = [1, 1, 1];

saturated_array = area_peak(:, saturated_idx)
diluted_array = area_peak(:, diluted_idx)
saturated_error = darea_peak(:, saturated_idx)
diluted_error = darea_peak(:, diluted_idx)
bkg_col  = [1, 1, 1];
%[normalized_reactivity, normalized_error, seqpos_out] = get_reactivities(saturated_array, diluted_array, saturated_error, diluted_error, bkg_col, ref_peak, seqpos, [], ['nomod', 'dms', '1m7'], sequence, offset, sd_cutoff);
%plot(normalized_reactivity(:, 1:3)*50)
clf
plot(normalized_reactivity(:, 1:3))
plot(normalized_reactivity(:, 1:3))*50
plot(normalized_reactivity(:, 1:3)*50)
[d_DMS_minus, da_DMS_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 2), normalized_error(:, 2), [], seqpos_out, sequence, offset);
[d_DMS_minus, da_DMS_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 2)*20, normalized_error(:, 2)*20, [], seqpos_out, sequence, offset);
[d_1M7_minus, da_1M7_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 3), normalized_error(:, 3), [], seqpos_out, sequence, offset);
[d_1M7_minus, da_1M7_minus, flags] = average_data_filter_outliers(normalized_reactivity(:, 3)*20, normalized_error(:, 3)*20, [], seqpos_out, sequence, offset);///
