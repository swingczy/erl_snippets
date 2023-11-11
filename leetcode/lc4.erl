-module(lc4).

%% leetcode 4, hard, median-of-two-sorted-arrays

-spec find_median_sorted_arrays(Nums1 :: [integer()], Nums2 :: [integer()]) -> float().
find_median_sorted_arrays(Nums1, Nums2) ->
  MergedArr = merge(Nums1, Nums2, []),
  MLen = length(MergedArr),
  case MLen rem 2 of
    1 ->
      lists:nth(1 + MLen div 2, MergedArr);
    0 ->
      (lists:nth(MLen div 2, MergedArr) + lists:nth(1 + MLen div 2, MergedArr)) / 2
  end
  .

merge(L1, L2, MergedArr) when length(L1) =:= 0 ->
  MergedArr ++ L2;
merge(L1, L2, MergedArr) when length(L2) =:= 0 ->
  MergedArr ++ L1;
merge([H1 | T1] = L1, [H2 | T2] = L2, MergedArr) ->
  if
    H1 < H2 ->
      merge(T1, L2, MergedArr ++ [H1]);
    H1 >= H2 ->
      merge(L1, T2, MergedArr ++ [H2])
  end
  .
