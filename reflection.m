function retval = reflection (first, second)
  ans = first + second
  inside();
  return;  
  function ret = inside()
    printf("Hey")
    return;
  endfunction
endfunction
