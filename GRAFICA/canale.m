%===============================================
% 			 canale
%-----------------------------------------------
%   velocita' in un canale nel regime di Poiseuille
%   di lunghezza L e larghezza h
%	  	u = a*y*(h-y)     	
%		v = 0
%-----------------------------------------------
  	clear all
	close;   
 	h1 = figure(1);
	set(h1, 'Units', 'normalized', 'Position', [0.5 0.5 0.5 0.45]);
 	whitebg(h1, 'w')
	L=11; h=4; a=3;
  	axis( [0 L 0 h] );  % [xmin xmax ymin ymax]
 	axis equal
	hold on
 	axis off
%	-----------------------------------------------
%	   
%	-----------------------------------------------
 	px=2; 
	py=0.2; 
	fs=0.1;	% fattore scala velocita'
	line([0   11],[0  0],'color','k', 'linewidth',1);
	line([0   11],[h  h],'color','k', 'linewidth',1);

	for x=0:px:L
		for y=0:py:h
			u= a *y*(h-y);
			xu=x+u*fs;
 			line([x   xu],[y  y],'color','k', 'linewidth',0.5);
 			f_pallina(x,y,0.02,'k')
 		end
	end
	
  %-----------------------------------------------
  	
	
	
	
	
	
	