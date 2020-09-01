function quicksort (arr, p, r)
  if p < r
    j = partition(arr, p, r);
    quicksort(arr, p, j-1);
    quicksort(arr, j+1, r);
	endif
endfunction

function r  = partition(arr, p, r)
	pivot = arr(r);
  while p < r
    while lt(arr(p), pivot)
      p++;
      while gt(arr(r), pivot)
        r--;
        if arr(p) == arr(r)
          p++;
	      else p < r
          temp = arr(p);
          arr(p) = arr(r);
          arr(r) = temp;
        endif
      endwhile
    endwhile
  endwhile
  return;
endfunction