function ret = binarySearch(n, arr)
  left = 1;
  right = length(arr) - 1;
  do
    mid = ceil((left + right) / 2);
    ret = mid;
    if arr(mid) < n
      left = mid + 1;
    elseif arr(mid) > n
      right = mid - 1;
    else
      return;
    endif
  until left >= right
  if arr(left) == n
    ret = left;
  else
    ret = -1;
  endif
  return;
endfunction
