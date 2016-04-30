%===============================================
% 	campoElastico campo di una forza centrale elastica
%	  	v=-k r     	
%-----------------------------------------------
  	clear all
	close;   
 	h1 = figure(1);
	set(h1, 'Units', 'normalized', 'Position', [0.5 0.5 0.5 0.45]);
 	whitebg(h1, 'w')
	R=11;
  	axis( [-R R -R R] );  % [xmin xmax ymin ymax]
 	axis equal
	hold on
 	axis off
%	-----------------------------------------------
%	   
%	-----------------------------------------------
 	pr=2; 
	pt=2*pi/24;
	k=1;
 	fs=0.1;	% fattore scala forza
% 	line([0   11],[0  0],'color','k', 'linewidth',1);
% 	line([0   11],[h  h],'color','k', 'linewidth',1);
 	for r=0:pr:R
		for t=0:pt:(2*pi)
			v= k*r;
			x=r*cos(t); y=r*sin(t);
			xv=x-v*cos(t)*fs;
 			yv=y-v*sin(t)*fs;
	 		line([x   xv],[y  yv],'color','k', 'linewidth',1);
 			f_pallina(x,y,0.1,'k')
 		end
	end
	
  %-----------------------------------------------
  	
	
	
	
	
	
	