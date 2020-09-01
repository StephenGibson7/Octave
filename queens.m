function ret = queens()
  board = zeros(8,8);
  pieces = 0;
  row = 1;
  col = 1;
  while pieces != 8
    vert = true;
    diag1 = true;
    diag2 = true;
    for i = 1:8
      if board(i,col) == 1
        vert = false;
      endif
    end
    temprow = row;
    tempcol = col;
    while temprow > 1 && tempcol > 1
      temprow--;
      tempcol--;
    endwhile
    while temprow < 9 && tempcol < 9
      if board(temprow,tempcol) == 1
        diag1 = false;
      endif
      temprow++;
      tempcol++;
    endwhile
    temprow = row;
    tempcol = col;
    while temprow > 1 && tempcol < 8
      temprow--;
      tempcol++;
    endwhile
    while temprow < 8 && tempcol > 1
      if board(temprow,tempcol) == 1
        diag2 = false;
      endif
      temprow++;
      tempcol--;
    endwhile
    if vert && diag1 && diag2
      board(row,col) = 1;
      pieces++;
      row++;
      col = 1;
    else
      if col == 8
        row--;
        while board(row,col) == 1
          board(row,col) = 0;
          pieces--;
          row--;
        endwhile
        for i = 1:8
          if board(row,i) == 1
            board(row,i) = 0;
            pieces--;
            col = i + 1;
          endif
        end
      else
        col++;
      endif
    endif
  endwhile
  ret = board;
  return;
endfunction