%	-------------------------------------------------------------- 
%   	  costruzione di una ellisse
%	-------------------------------------------------------------- 
	clear all   
%	------------------ attiva la grafica -------------------------- 
	close all		
	h1 = figure(1); 	
 	set(h1, 'Units', 'normalized', 'Position', [0.5 0.5 0.45 0.5]);
%	set(h1, 'Units', 'normalized', 'Position', [0 0  1  0.90]);
  	whitebg(h1, 'black')		% 	colore di fondo
	axis equal % tiene la stessa scala in x ed y
	axis([-5 5 -5 5 ]);  % [xmin xmax ymin ymax]
	hold on ; 	pause  on
%	-------------------------------------------------------------- 
%			traccia un ellisse dati i semiassi
%	--------------------------------------------------------------
% 	equazioni parametriche in coordinate cartesiane: parametro l'angolo f.
	f = 0 : 0.01 : 2*pi;  % array
	a=4;	 b=2;	% semiassi 

	pause(0.5) 
%	traccia i fuochi
	c=sqrt(a*a-b*b);	%	semi-distanza focale
	plot(c,0,'*') ; plot(-c,0,'*')	% segna i due fuochi con un asterisco	
	text(c,0,'  F', 'fontsize',18)	% metti una scritta vicino ai fuochi
	text(-c,0,'    F''', 'fontsize',18)
	pause(0.5) 
	line([-a  a],[0  0],'color',' red')	% asse orizzontale
	line([0  0],[-b  b],'color','red') % asse verticale
	pause(0.5) 
% 	cerchio esterno
	x= a*cos(f); 	 y= a*sin(f); 	 % array
	plot(x,y,'color','cyan')
	pause(0.5) 
% 	cerchio interno
	x= b*cos(f); 	 y= b*sin(f); 		% array
	plot(x,y,'color','green')
	pause(0.5) 
%	descrive la costruzione 
	for k= 0 : 0.3 : 2*pi;
	 	x1=a*cos(k); 	y1=a*sin(k);
	 	x2=a*cos(k); 	y2=b*sin(k);
	 	x3=b*cos(k); 	y3=b*sin(k);
 		line([0  x1],[0  y1],'color','white')  
		line([x1  x1],[y1  y2],'color','cyan')  
		line([x2  x3],[y2  y2],'color','green')
        plot(x2,y2,'*y')
	pause(0.5)
    end
  	x= a*cos(f); 	 y= b*sin(f); 		% array
  	plot(x,y,'linewidth',1)
%	-------------------------------------------------------------- 