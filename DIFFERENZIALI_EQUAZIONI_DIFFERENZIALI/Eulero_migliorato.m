%   Eulero_migliorato.m
%   integra una equazione differenziale del primo ordine 
%   usando il metodo di Eulero migliorato.
%   equazione: y'=f(x,y)
%   soluzione esatta: y=x*exp(-x)
%   derivata prima:      y' = (1-x)*exp(-x)
%   che si pu˜ scrivere: y' = exp(-x) - y
%	richiama la funzione "f_caio" "f_graficoCol.m"
%
    clear all; close all; clc
%---------------- ATTIVA LA GRAFICA ----------------- 
%	f_graficoCol(sfondo,dimensione,griglia,isometrico)
%	sfondo: 		nero = 1  		bianco = 0
%	dimensione: 	grande = 1  	piccolo = 0
%	griglia:  		si = 1  		no = 0
%	isometrico: 	si = 1  		no = 0
 	f_graficoCol(1,1,1,0) 
%	---------------------------  
% 	traccia soluzione esatta
	p = 0.01;
	xx=0 : p : 7;
	g = xx.*exp(-xx);
	plot(xx,g,'c')
    	title('Eulero migliorato: II ordine','fontsize',18,'color','m')
%	=====================================
%   Eulero migliorato
pause
	h = 0.1; % notare a passo piu' grossolano
% 	crea un vettore "T" da "0" a "7" a passo "h"		
	t = 0 : h : 7 ;  
	n=size(t,2);
	t(1) = 0;
	u(1) = 0;	%   posizione iniziale
%
  	for k = 1 : (n-1)
%		incremento con la derivata nel punto iniziale
		m1 = f_caio(t(k), u(k));
%		incremento con la derivata nel punto finale
		m2 = f_caio(t(k)+h, u(k)+m1*h);
%	 	fa la media dei due incrementi
  		m = (m1+m2)/2;  
		t(k+1) = t(k) + h;
   		u(k+1) = u(k) + h*m; 
	end
%	
	plot(t,u,'y+')
%	=====================================
%  function [z] = f_caio(u,v);
% % chiamata da "EuleroPrimoOrdine.m"
% % chiamata da  "Eulero_migliorato.m"
% % chiamata da "quattroMetodi.m"
% % derivata di:  y =  x * exp(-x)  
% % e' y'=exp(-x) - x exp(-x)
% 	z =  exp(-u)-v; 
% % per Eulero migliorato e altri metodi vedere  quattroMetodi.m