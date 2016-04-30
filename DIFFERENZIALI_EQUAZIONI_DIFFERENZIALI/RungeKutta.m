%	==============================================================
%    				   RungeKutta0.m
%   Integrazione equazione differenziale y'=f(x,y)
%      con il metodo di Runge-Kutta del 4° ordine.
%	-------------------------------------------------------------- 
%	richiama la funzione "f_caio" 
 	clear  % elimina tutte le variabili in memoria
	clc    % pulisce la finestra dei comandi
%	-------------------------------------------------------------- 
%		seleziona modalita' grafica 
%	-------------------------------------------------------------- 
% 	chiudi finestra grafica precedente	
	close		
% 	apre una finestra grafica di dimensioni volute
	h1 = figure(1); 	
% 	set(h1, 'Units', 'normalized', 'Position', [0 0.5 0.5 0.45);
	set(h1, 'Units', 'normalized', 'Position', [0  0  1  0.9]);
% 	colore di fondo
  	whitebg(h1, 'black')
	hold on ; zoom on; pause on;
%	-------------------------------------------------------------- 
%					scritte
%	-------------------------------------------------------------- 
 	h3=title('Integrazione col metodo di Runge-Kutta IV ordine');
 	set(h3,'fontsize',24,'color','yellow','fontname','times');
	xlabel('x');  ylabel('y');
%	-------------------------------------------------------------- 
% 				soluzione esatta
%	-------------------------------------------------------------- 			
	p = 0.01;  	% passo per il tracciamento
% 	crea un vettore "X" da "0" a "7" a passo "p"		
	X = 0 : p : 7 ;  
  	Y = X.*exp(-X) ; 
 	plot (X, Y,'c');
	clear X Y;
	pause
%	-------------------------------------------------------------- 
% 	soluzione approssimata (metodo di Runge-Kutta) 		
%	-------------------------------------------------------------- 
	h = 0.1; % notare a passo piu' grande
% 	crea un vettore "X" da "0" a "7" a passo "h"		
	X = 0 : h : 7 ;  
	n=size(X,2);
		
	X(1) = 0;  Y(1) = 0; 
	for k = 1:(n-1)
 		K1 = h*f_caio(X(k), Y(k)) ;
 		K2 = h*f_caio(X(k)+h/2, Y(k)+K1/2) ;
 		K3 = h*f_caio(X(k)+h/2, Y(k)+K2/2) ;
 		K4 = h*f_caio(X(k)+h,   Y(k)+K3) ;
 		K = (K1+2*K2+2*K3+K4) / 6;			
		X(k+1) = X(k) + h; 
		Y(k+1) = Y(k) + K; 
 	    plot (X(k+1), Y(k+1), 'y+','linewidth',1,'era','back');
 	end
%	=============================================================
% 	Qui si riporta la funzione che deve essere scritta in un file a parte per essere richiamata
%	dal programma riportato sopra la linea ======
%	----------------------------------------------------------------     	 
%  	function [z] = f_caio(x,y);
% % 	chiamata da "RungeKutta0.m"
% % 	derivata di:  y =  x .* exp(-x)
%       z = exp(-x) - y ;
