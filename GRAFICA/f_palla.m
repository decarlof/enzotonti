 	function  f_pallina(xC, yC, r, col)
%	traccia una circonferenza di centro C e raggio r
	d = 2*pi /8;
	T = 0 : d :2*pi;
	X = xC + r*cos(T); 	Y = yC + r*sin(T); 
 	fill(X,Y,col,'era','back','edgecolor',col);