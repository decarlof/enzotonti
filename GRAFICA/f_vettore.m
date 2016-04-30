    function f_vettore(x,y,Vx,Vy,col,spess);
%--------------------------------------------------------------------------------
%   funzione vettore(x,y,Vx,Vy,col,spess) 
%--------------------------------------------------------------------------------
% Traccia un vettore con origine in x,y
% con componenti Vx, Vy, in colore "col"
% e con spessore della linea di "spess".
    fs =  0.3 ;     	% fattore scala forze
% estremi del vettore
	x1 = x+Vx*fs; 	y1 = y+Vy*fs ;	% array
% traccia il corpo del vettore (senza la freccia)
	linea(x,y,x1,y1,col,spess) ;
	plot(x,y,'.','color',col,'linewidth',4) ; %pallina
%------------------------------------------------------------------ fine -------