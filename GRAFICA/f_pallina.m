 	function  f_pallina(xC, yC, r, col)
 %	traccia una circonferenza di centro C e raggio r e di colore "col"
	d = 2*pi /16;
	T = 0 : d : 2*pi;
	X = xC + r*cos(T);
 	Y = yC + r*sin(T);
   	fill(X,Y,col,'edgecolor',col); % ,'era','back'
%   	fill(X,Y,col); % ,'era','back'
