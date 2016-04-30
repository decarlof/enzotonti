%===============================================
% 			 campiVettoriali.m  	
%-----------------------------------------------
% Questo programma traccia alcuni campi vettoriali

% 	chiudi finestre grafiche precedenti	
	close all		
% 	apre una finestra grafica di dimensioni volute
	h1 = figure(1); 	
%	set(h1, 'Units', 'normalized', 'Position', [0.5 0.5 0.45 0.5]);
	set(h1, 'Units', 'normalized', 'Position', [0 0  1  0.90]);
% 	colore di fondo
  	whitebg(h1, 'black')
	R=11;
	Re=12;
  	axis( [-Re Re -Re Re] );  % [xmin xmax ymin ymax]
 	axis equal
	hold on
 	axis off
    
%   seleziona il campo
%	nome='Biot';
%	nome='rotazione';
% 	nome='BiotCompleto';
	nome='Coulomb';
%	nome='elastico';
	
	switch nome
%	-----------------------------------------------
%	   Biot
%	-----------------------------------------------
	case 'Biot'
 		pr=1; 
		pt=2*pi/12;
		k=1;
 		fs= 8;	% fattore scala forza
		f_pallina(0,0,0.12,'r')
 		for r=4*pr : pr : R
			for t=0:pt:(2*pi)
				v= k/r;
				x=r*cos(t); y=r*sin(t);
				xv=x- v*sin(t)*fs;
 				yv=y+v*cos(t)*fs;
	 			line([x   xv],[y  yv],'color','y', 'linewidth',1);
 				f_pallina(x,y,0.12,'y')
 			end
		end
%		f_circonferenza(0,0,5.5*pr,'w');
		f_circonferenza(0,0,10.5*pr,'c');
%	--------------------------------------
	case 'rotazione'	
%	--------------------------------------
 		pr=1; 
		pt=2*pi/12;
		k=1;
 		fs=0.4;	% fattore scala forza
		f_pallina(0,0,0.12,'w')
 		for r=pr:pr:R
			for t=0:pt:(2*pi)
				v= k*r;
				x=r*cos(t); y=r*sin(t);
				xv=x- v*sin(t)*fs;
 				yv=y+v*cos(t)*fs;
	 			line([x   xv],[y  yv],'color','c', 'linewidth',1);
 				f_pallina(x,y,0.12,'c')
 			end
		end
		f_circonferenza(0,0,10.5*pr,'r');
%	--------------------------------------
	case 'BiotCompleto'	
%	--------------------------------------
	 	pr=1; 
		pt=2*pi/12;
		ri=4*pr; 
      d = 2*pi /32;
	r=6;
	T = 0 : d :2*pi;
	X = r*cos(T); 	Y =  r*sin(T); 
 	fill(X,Y,'r','era','back','edgecolor','y');

% 	f_circonferenza(0,0,6*pr,'r');
 	f_circonferenza(0,0,10.*pr,'w');

		k=1;
 		fs=5;	% fattore scala forza
 		for r = ri: pr :R
			for t=0:pt:(2*pi)
				v= k/r;
				x=r*cos(t); y=r*sin(t);
				xv=x- v*sin(t)*fs;
 				yv=y+v*cos(t)*fs;
	 			line([x   xv],[y  yv],'color','w', 'linewidth',1);
 				f_pallina(x,y,0.1,'w')
 			end
		end
% 		interno
		for r = 0 : pr : ri
			for t=0:pt:(2*pi)
				v=k/ri^2 *r;
				x=r*cos(t); y=r*sin(t);
				xv=x- v*sin(t)*fs;
 				yv=y+v*cos(t)*fs;
	 			line([x   xv],[y  yv],'color','w', 'linewidth',1);
 				f_pallina(x,y,0.1,'w')
			end
		end
% 	cerchio pieno
%	--------------------------------------
	case 'Coulomb'	
%	--------------------------------------
  		pr=1; 
		pt=2*pi/12;
		k=1;
 		fs=2;	% fattore scala vettore
 		for r=2*pr : 2*pr : R
			for t=0 : pt :(2*pi)
				v= k/r;
				x=r*cos(t); y=r*sin(t);
				xv=x+ v*cos(t)*fs;
 				yv=y+ v*sin(t)*fs;
	 			line([x   xv],[y  yv],'color','w', 'linewidth',1);
 				f_pallina(x,y,0.1,'w')
 			end
		end
% 	f_circonferenza(0,0,6*pr,'w');
% 	f_circonferenza(0,0,10.*pr,'w');
	case 'elastico'	
 		pr=1; 
		pt=2*pi/12;
		k=0.08;
 		fs=2;	% fattore scala vettore
 		for r=2*pr : 2*pr : R
			for t=0 : pt :(2*pi)
				v= - k*r;
				x=r*cos(t); y=r*sin(t);
				xv=x+ v*cos(t)*fs;
 				yv=y+ v*sin(t)*fs;
	 			line([x   xv],[y  yv],'color','w', 'linewidth',1);
 				f_pallina(x,y,0.1,'w')
 			end
		end
% 	f_circonferenza(0,0,6*pr,'w');
% 	f_circonferenza(0,0,10.*pr,'w');
	end  	

	
	
	
	
	
	