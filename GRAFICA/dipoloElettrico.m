%			        dipoloElettrico
%	Traccia il campo elettrico generato da due cariche concentrate
%   ===============================================================
	clc ; clear all; close all
%	================ attiva la grafica ================
	h1 = figure(1) ; 	
%	set(h1, 'Units', 'normalized', 'Position', [0  0  1  1]) ; 
	set(h1, 'Units', 'normalized', 'Position', [0.5  0.5  0.5  0.5]) ; 
 	whitebg('white'); 
	hold on ,  pause on ,  axis on
	axis equal , axis([-5 5 -5  5]) ,  axis off , zoom on , hold on 
%	============ traccia i vettori del campo ============
	x1 = -2 ;    y1=0;  % posiziona una carica
	x2 = +2; 	  y2=0;  % posiziona l'altra carica
	R = 0.1;               % raggio cerchio
	f_pallina(x1, y1, R, 'k');	f_pallina(x2, y2, R, 'k')
	n=20;  p=0.5; c=1; Q1=+1; Q2=+1; fs= 0.4;
 	for i =1 : n 
		for j=1:n
 			x = -5.25+ i*p ;   	y=-5.25+ j*p; 
			r1=sqrt((x-x1)^2 +(y-y1)^2);
			r2=sqrt((x-x2)^2 +(y-y2)^2);
		       Ex= c*Q1*(x-x1)/r1^3+c*Q2*(x-x2)/r2^3;
		       Ey= c*Q1*(y-y1)/r1^3+c*Q2*(y-y2)/r2^3;
			xa=x+fs*Ex; 	ya=y+fs*Ey; 
			s1= (x-x1)^2+(y-y1)^2;  s2= (x-x2)^2+(y-y2)^2;
			if  s1 > p & s2 > p
				f_pallina(x,y,0.03,'k')   
			    	line([x  xa],[y  ya],'color','k','linewidth',1)
			end			
		end
	end 	
% 	======================== FINE ===============
%  	function  f_pallina(xC, yC, r, col)
%    % traccia una circonferenza di centro C,raggio r, colore "col"
% 	d = 2*pi /16;
% 	T = 0 : d : 2*pi;
% 	X = xC + r*cos(T);
%  	Y = yC + r*sin(T);
%    	fill(X,Y,col,'edgecolor',col);
% 	============================================

