function  f_circonferenza(xC,yC,r,c);
					
	t= 0 : 0.05 : 2*pi;
 
	x=xC+r*cos(t);
	y=yC+r*sin(t);
	plot(x,y,'color',c)
 
 