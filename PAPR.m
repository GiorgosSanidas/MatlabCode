function paprsimatos  =  PAPR (Dt,u )

paprsimatos = 0 ;

numerator   = Dt*max(u.^2) ;
denumerator = Dt*mean(u.^2) ;

paprsimatos = 10*log10(numerator/denumerator) ; 

% endfunction         % USED IN OCTAVE,   NOT NEEDED IN MATLAB/INSERT A "%" to COMMENT 