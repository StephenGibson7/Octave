## Copyright (C) 2020 scuba
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} diffeq (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Stephen Gibson <scuba@SPECTREOFSTEPHE>
## Created: 2020-06-03

function retval = diffeq (input1)
  h = 0.01;
  y = input1;
  t = 0;
  x = 0:h:4;
  yh = x;
  c = 2;
  yh(1) = 2;
  while c != (4/h)+2
    %f = 5 - 3 * sqrt(y);
    f = -t * y + 0.1 * y^3;
    y = y + h * f;
    yh(c) = y;
    t = t + h;
    c = c + 1;
  endwhile
  i = 1 + 0.5 / h;
  while i <= (2.5 / h) + 1
    yh(i)
    i = 0.5 / h + i;
  endwhile
  hold on;
  plot(x,yh)
endfunction
