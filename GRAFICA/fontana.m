 % fontana
 
 %-----------------------------------------------
  	clear all
	close;   
 	h1 = figure(1);
	set(h1, 'Units', 'normalized', 'Position', [0.5 0.5 0.5 0.45]);
 	whitebg(h1, 'white')
   	axis( [-5 5 0  80] );  % [xmin xmax ymin ymax]
 	axis equal
	hold on
 	axis off
%	-----------------------------------------------
% ugello
	X=[-0.7  -0.3   0.3   0.7  -0.7  ];Y=[0  6  6  0  0];
	fill(X,Y,'k')
% getto
	x0=0; y0=6; % m
	v0=30; % m/s
 	a=2*pi/180; % rad
	g=9.81; % m/s^2
	h=0.2; % s; intervallo temporale
	tf=10; % s
 
	V=[34  30  25 22];
 	A=[0  2  6  4];
	for k=1: 4
		for t=0: h: tf
			a=A(k)*pi/180;
			x=x0-V(k)*sin(a)*t;
			y=y0+V(k)*cos(a)*t-g*t^2/2;
			plot(x,y, 'ko')
		end
	end
	V=[30  27  26 24];
	A=[3  5  4  3];
	for k=1: 4
		a=A(k)*pi/180;
		for t=0: h: tf
			x=x0+V(k)*sin(a)*t;
			y=y0+V(k)*cos(a)*t-g*t^2/2;
			plot(x,y, 'ko')
		end
	end

	