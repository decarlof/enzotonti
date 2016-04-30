%--------- ATTIVA LA  GRAFICA ---------------------
 	close
	h2 = figure(1);  clf
	hold on
%	set(h2, 'units', 'normalized', 'position', [0 0 1 0.9])	
	set(h2, 'units', 'normalized', 'position', [0.5 0.5 0.5 0.45])	
%	whitebg('k');
  	set(gcf,'Color','w');  % deve precedere axis
% 	fissa e traccia gli assi	
	axis equal % deve precedere axis
%	axis( [2 16 0 13] );  % [xmin xmax ymin ymax]
 	hold on ; pause off ; zoom on
	axis off
	clc
	pp=1;
%	-----------------------------------------------	
% 	calcola e traccia il vettore velocita' nell'interno del triangolo  
%	-----------------------------------------------		
% 	Sia dato un campo vettoriale piano affine
%		u  =  a + Gxx*x + Gxy*y
%		v  =  b + Gyx*x + Gyy*y
 	w=2;
   	a=0; b=0;
	Gxx= 0; Gxy=0;
	Gyx=w;	Gyy=0;
	fs=0.024;
 %
	subplot(2,2,1); hold on;
	axis off
	axis equal % deve precedere axis
%	axis( [2 16 0 13] );  % [xmin xmax ymin ymax]
	for y = 1 : pp : 12
		for x  =  3 : pp : 15
  			u  =  a + Gxx*x  + Gxy*y;
 			v  =  b + Gyx*x + Gyy*y;
 			line([x   x+fs*u],[y   y+fs*v],'color', 'k','linewidth',1 );	
  			f_palla( x,  y, 0.05, 'k');
 		end   
	end
%-------------------------------
	subplot(2,2,2); hold on;
	axis equal % deve precedere axis
	axis off
%	axis( [2 16 0 13] );  % [xmin xmax ymin ymax]
%	u=-w*(y-y0) = (w*y0)  +(-w)*y= a + Gxx*x + Gxy*y
% 	v=+w*(x-x0)= (-w*x0)+(+w)*x= b + Gyx*x + Gyy*y
	x0=9; y0=6;
 	w=2;
 	a=w*y0; b=-w*x0;
 	Gxx= 0; Gxy=-w;
	Gyx=w;	Gyy=0;
	fs=0.024;
 	plot(x0,y0,'ko')
%
	for y = 1 : pp : 12
		for x  =  3 : pp : 15
  			u  =  a + Gxx*x  + Gxy*y;
 			v  =  b + Gyx*x  + Gyy*y;
 			line([x   x+fs*u],[y   y+fs*v],'color', 'k','linewidth',1 );	
  			f_palla( x,  y, 0.05, 'k');
 		end   
	end
%-------------------------------
% 	Sia dato un campo vettoriale piano affine
%		u  =  a + Gxx*x + Gxy*y
%		v  =  b + Gyx*x + Gyy*y
 	w=2;
   	a=0; b=0;
	Gxx= w; Gxy=0;
	Gyx=0;	Gyy=0;
	fs=0.024;
 %
	subplot(2,2,3); hold on;
	axis equal % deve precedere axis
	axis off
%	axis( [2 16 0 13] );  % [xmin xmax ymin ymax]
	for y = 1 : pp : 12
		for x  =  3 : pp : 15
  			u  =  a + Gxx*x  + Gxy*y;
 			v  =  b + Gyx*x + Gyy*y;
 			line([x   x+fs*u],[y   y+fs*v],'color', 'k','linewidth',1 );	
  			f_palla( x,  y, 0.05, 'k');
 		end   
	end
%-------------------------------
% 	Sia dato un campo vettoriale piano affine
%		u  =  a + Gxx*x + Gxy*y
%		v  =  b + Gyx*x + Gyy*y
 	w=2;
   	a=0; b=0;
	Gxx= 0; Gxy=w;
	Gyx=0;	Gyy=0;
	fs=0.024;
 %
	subplot(2,2,4); hold on; 
	axis equal % deve precedere axis
	axis off
%	axis( [2 16 0 13] );  % [xmin xmax ymin ymax]
	for y = 1 : pp : 12
		for x  =  3 : pp : 15
  			u  =  a + Gxx*x  + Gxy*y;
 			v  =  b + Gyx*x + Gyy*y;
 			line([x   x+fs*u],[y   y+fs*v],'color', 'k','linewidth',1 );	
  			f_palla( x,  y, 0.05, 'k');
 		end   
	end

%	----------------------------------------------- fine

   
 
	