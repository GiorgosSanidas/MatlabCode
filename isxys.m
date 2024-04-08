function isxysimatos  =  isxys (Dt,u )
isxysimatos=0;
for i=1:(length(u)-1)
 isxysimatos= isxysimatos+Dt*u(i)^2 ;
end
  

isxysimatos = isxysimatos / (Dt*(length(u)-1));

% endfunction         % USED IN OCTAVE,   NOT NEEDED IN MATLAB/INSERT A "%" to COMMENT 