
function dclevel = Dclevel (Dt, u)
  dclevel=0;
  for i=1:length(u)
    dclevel =dclevel+Dt*u(i);
  end
  
dclevel =dclevel/ (Dt*length(u));

% endfunction         % USED IN OCTAVE,   NOT NEEDED IN MATLAB/INSERT A "%" to COMMENT 
