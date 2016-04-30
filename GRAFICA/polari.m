%	cella elementare in coordinate polari 
%
	clc ; clear all;
%	----------modalita' grafica--------------
	close;  h1 = figure(1) ; 	
%	set(h1, 'Units', 'normalized', 'Position', [0  0  1  1]) ; 
	set(h1, 'Units', 'normalized', 'Position', [0.5  0.5  0.5  0.5]) ; 
 	whitebg('w'); 
	hold on ;  pause on ;  axis off
	axis equal ;  zoom on 
	a=8;    
%	axis([0  a  0  a  0  a]);
% 	------------------------------------------------
%	coordinate dei vertici
R=10; 
c= pi/18;
b=R/10; 
for an = 0 : c : pi/2
	x= R*cos(an); 		y=R*sin(an);
	line([0  x],[0  y],'color','k') ;  
end

for an = 0 : c : pi/2-c
	for r= R/10 : R/10 : R
		x1= r*cos(an); 		y1=r*sin(an);
		x2= r*cos(an+c); 		y2=r*sin(an+c);
		line([x1  x2],[y1  y2],'color','k') ;  
	end
end
% duale 
for an = c/2 : c : pi/2-c/2
	x= R*cos(an); 		y=R*sin(an);
	line([0  x],[0  y],'color','k','linewidth',2) ;  
end
 
for an = 0 : c : pi/2-2*c
	for r= b : b : R-b
		x1= (r+b/2)*cos(an+c/2); 		y1=(r+b/2)*sin(an+c/2);
		x2= (r+b/2)*cos(an+3*c/2); 	y2=(r+b/2)*sin(an+3*c/2);
		line([x1  x2],[y1  y2],'color','k','linewidth',2) ;  
	end
end
%  ritocco estremi
	for r= b : b : R-b
		x1= (r+b/2)*cos(0); 		y1=(r+b/2)*sin(0);
		x2= (r+b/2)*cos(c/2); 	y2=(r+b/2)*sin(c/2);
		line([x1  x2],[y1  y2],'color','k','linewidth',2) ;  
	end
	for r= b : b : R-b
		x1= (r+b/2)*cos(pi/2-c/2); 		y1=(r+b/2)*sin(pi/2-c/2);
		x2= (r+b/2)*cos(pi/2); 	y2=(r+b/2)*sin(pi/2);
		line([x1  x2],[y1  y2],'color','k','linewidth',2) ;  
	end




% 	------------------------------------------------
 
 