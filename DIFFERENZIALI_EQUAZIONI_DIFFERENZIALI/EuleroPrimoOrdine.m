 % ATTENZIONE: non faceva nulla 
 % dichiarava Warning: Reference to uninitialized variable Eulero.
% la ragione è che esisteva un programma in tex con lo stesso nome! 
% 	======================================
%    				   EULERO
% 	======================================
%	richiama la funzione "f_caio" "f_graficoCol.m"
%  Integrazione equazione differenziale y'=f(x,y)
%	funzione:			y = 18*x*exp(-x)
%	derivata prima: 	y'= 18*exp(-x) - y 
clear all
%---------------- ATTIVA LA GRAFICA ----------------- 
%	f_graficoCol(sfondo,dimensione,griglia,isometrico)
%	sfondo: 		nero = 1  		bianco = 0
%	dimensione: 	grande = 1  	piccolo = 0
%	griglia:  		si = 1  		no = 0
%	isometrico: 	si = 1  		no = 0
 	f_graficoCol(1,1,1,0) 
%	--------------soluzione esatta----------------------------- 	 			
	T = 0 : 0.01 : 7 ; 			% crea un array  da 0 a 7 a passo 0.01
	U = T .* exp(-T);	% attenzione al "./"
	plot (T, U,'b');
 
%	-----------------integrazione Eulero ------------------- 

	h = 0.1; % notare a passo piu' grossolano
	durata =7;
	n=round(durata/h);
% 	Matlab non accetta lo zero come primo indice
	t(1) = 0;  
	u(1) = 0; 
	for k = 1:(n-1)
		m = f_caio(t(k), u(k)) ;	
		t(k+1) = t(k) + h; 
		u(k+1) = u(k) + m*h; 
 	end	
	plot(t,u,'y+')
%	--------------------------------------------------- fine 
%  function [z] = f_caio(u,v);
% % chiamata da "EuleroPrimoOrdine.m"
% % chiamata da "Eulero_migliorato.m"
% % chiamata da "quattroMetodi.m"
% % derivata di:  y =  x * exp(-x)  
% % e' y'=exp(-x) - x exp(-x)
% 	z =  exp(-u)-v; 
% % per Eulero migliorato e altri metodi vedere  quattroMetodi.m

 