function retval = vectorfield(input1)
  for y = 0:4
    for t = 0:5
    f = -t * y + 0.1 * y^3
    %hold on;
    %quiver(t,y,f);
    endfor
  endfor
endfunction
