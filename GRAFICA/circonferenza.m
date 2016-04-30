%   traccia una circonferenza o un cerchio
%   --------------------------------------
    clc
	close; 
    h1 = figure(1);
    % 	colore di fondo
  	whitebg(h1, 'w')	
	set(h1,'Units', 'normalized'); 
	set(h1,'Position', [0.5  0.5 0.5  0.5]); 
 	hold on ; pause on  
 	axis([0 5 0 6]);
	axis equal ; grid on 
%   --------------------------------------
	xC = 3; yC= 3;
	R = 2;	N=50; p= 2*pi /N;
	plot(xC,yC,'k*') % marca il centro
	t = 0 : p : (2*pi);
	x = xC + R*cos(t);
	y = yC + R*sin(t);
    
	k=0;
	if k==0
		plot(x,y,'k','linewidth',2) % circonferenza
	else
		fill(x,y,'r') % cerchio pieno
    end
 %   --------------------------------------
