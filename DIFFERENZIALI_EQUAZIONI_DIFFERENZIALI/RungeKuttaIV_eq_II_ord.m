%	==============================================================
%      			RungeKuttaIV.m
%   Integrazione equazione differenziale  
%			x''(t)= f( t, x(t), x'(t) )
%   con il metodo di Runge-Kutta del IV ordine.
% 			x'(t) = F ( t , x(t) , v(t) )
%			v'(t) = G( t , x(t) , v(t) )
%  	chiama "f_armonici"
%-------------------------------------------------------
 	clear all	% azzera le variabili in memoria
	clc		% pulisci finestra di testo
	close all		
	global p k m % fa sentire le costanti alle funzioni chiamate
%	---------------------- attiva la grafica ----------------
%	f_graficoCol(sfondo ,dimensione, griglia, isometrico)
	f_graficoCol(1,1,1,0) 
%	-------------------------------------------------------------- 
%					scritte
%	-------------------------------------------------------------- 
 	h3=title('integrazione col metodo di Runge-Kutta IV ordine');
 	set(h3,'fontsize',24,'color','yellow','fontname','times');
	xlabel('x');  ylabel('y');
%	-------------------------------------------------------------- 
% 				soluzione esatta  x=sin(t)
%	-------------------------------------------------------------- 			
	t0 =0;	
	x0 = 1;	v0 = 0;   	% condizioni iniziali
	tf = 20;	 		% istante finale
	h = 0.01;  		% intervallo temporale per l'integrazione
	k = 12; 	m=2; 	% k = rigidezza ;  m =  massa	
	w = sqrt(k/m);  	% pulsazione omega
%	grafico soluzione esatta
	T = t0 : h : tf;	% crea array dei tempi
	X = x0* cos(w*T);	% crea array delle posizioni
	plot(T,X,'c')
%	pause
%	--------------------------------------------------- 
% 			soluzione approssimata   		
%	--------------------------------------------------- 
	p = 0.1;	% passo per l'integrazione
	t = t0;	
	x = x0;	
	v = v0;
%	non memorizza in un array, traccia man mano
 	while t < tf 
		[Dx1,Dv1] = f_armonici(t, x , v) ;
 		[Dx2,Dv2] = f_armonici(t+p/2, x+Dx1/2, v+Dv1/2) ;
 		[Dx3,Dv3] = f_armonici(t+p/2, x+Dx2/2, v+Dv2/2) ;
 		[Dx4,Dv4] = f_armonici(t+p,  x+Dx3,   v+Dv3) ;
		Dx = (Dx1+2*Dx2+2*Dx3+Dx4) / 6; 
		Dv = (Dv1+2*Dv2+2*Dv3+Dv4) / 6; 
		tn = t+p;		
		xn = x+Dx;	
		vn = v+Dv;		
 		plot(tn,xn,'y+')
		
		t = tn;		
		x = xn; 		
		v = vn;
	end
%	================================================================
%  	   	function [Dx,Dv] = f_armonici (t, x, v);
% %	----------------------------------------------------------------  
%	global p k m % fa sentire le costanti alle funzioni chiamate
% % 	richiamata da "RK2ord.m"  
% %	per l'equazione dei moti armonici: m x''(t) = -k x(t)
% %	scritta come sistema dinamico 	
% %	x'(t)=F[ t, x(t),  v(t) ] 		x'(t) = v(t)
% %	v'(t)=G[ t, x(t),  v(t) ]		v'(t) = -k/m x(t)
%	---------------------------------------------------------------  
%	Dx = p * v;
%	Dv = - p * k / m * x;


 
 