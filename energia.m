function Energy  =  energia (Dt,u )
Energy=0;
for i=1:(length(u)-1)
  Energy= Energy+Dt*u(i)^2;
end
  

% endfunction         % USED IN OCTAVE,   NOT NEEDED IN MATLAB/INSERT A "%" to COMMENT 