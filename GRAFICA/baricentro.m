% -------------------------------------------------------	
%  			baricentro di un poligono (baricentro.m)
% -------------------------------------------------------	
	clear all 	% azzera tutte le variabili in memoria
 	clc  		% azzera la finestra dei comandi
% -------------------------------------------------------	
% 			ASSEGNA I DATI 
% -------------------------------------------------------	
 	
% 	assegna i vertici del poligono

	N=4;	% numero di vertici = numero di lati
	x(1)=4; y(1)=2;
	x(2)=8; y(2)=6;
	x(3)=2; y(3)=8;
	x(4)=2; y(4)=4;
	x(5)=4; y(5)=2;
 
%	assegnazione alternativa
% 	x=[4  8  2  2  4];
% 	y=[2  6  8  4  2];
%
% -------------------------------------------------------	
% 			ATTIVA LA GRAFICA
% -------------------------------------------------------	
%	close all	% chiudi tutte le finestre grafiche precedenti
	gg=figure;	% attiva una finestra nuova: gg è una variabile associata alla finestra
	set(gg, 'Units', 'normalized'); %  unità normalizzate alla finestra
	set(gg, 'Position', [0.5 0.5 0.5 0.45]); % posizione e dimensioni della finestra
%	set(gg, 'Position', [0 0 1 0.9]); % posizione e dimensioni della finestra
  	whitebg(gg, 'w')  % sfondo bianco 
	axis( [0 6 0 10] );  % [xmin xmax ymin ymax]
	axis equal  % usa le stesse misure in ascisse e in ordinate
	grid on 	% traccia una griglia
	hold on 	% importante! mantiene tutti i tracciamenti su una stessa finestra
% -------------------------------------------------------	
%			TRACCIA IL POLIGONO
% -------------------------------------------------------	
% 	for k=1:N
% 		line([x(k)  x(k+1)],[y(k) y(k+1)],'linewidth', 2); % traccia un lato alla volta
% 	end
	plot(x,y,'k','linewidth', 2) % tracciamento in colore nero
% -------------------------------------------------------	
%			TRACCIA I TRIANGOLI DALL'ORIGINE
% -------------------------------------------------------	
	for k=1 : N
        line([0  x(k)],[0  y(k)], 'color','red','linewidth', 1)
	end
% -------------------------------------------------------	
%	calcola l'area del poligono dividendolo in triangoli 
%	con un vertice nell'origine degli assi
% -------------------------------------------------------
%	aree dei triangoli: le aree sono orientate, alcune positive altre
%	negative a secondo del senso di percorrenza del loro contorno.

	for k = 1 : N
		a(k) = (x(k)*y(k+1) - x(k+1)*y(k))/2; 
	end
%
	A = 0;  % area del poligono (inizialmente zero)
	for k = 1 : N
		A = A + a(k);
	end
% ------------------------------------------------------	
%	calcola i baricentri dei triangoli 
% ------------------------------------------------------
% 	il numero di triangoli coincide col numero di lati
%	a(k) = det[1     0       0
% 				1   x(k)    y(k)
% 				1  x(k+1)  y(k+1)] /2
	for k = 1 : N
		xg(k)= (0+x(k)+x(k+1))/3;
		yg(k)= (0+y(k)+y(k+1))/3;
	end
  	
%	e il baricentro complessivo
% 	XG =(a(1)*xg(1)+ a(2)*xg(2) + ... a(N)*xg(N)) / A = S / A
% 	YG =(a(1)*yg(1)+ a(2)*yg(2) + ... a(N)*yg(N)) / A = T / A
	S = 0;  T = 0; % valori iniziali dei numeratori 
	for k = 1 : N
		S = S + a(k)*xg(k);
		T = T + a(k)*yg(k);
	end
	XG = S/A; YG = T/A; 
	plot(XG,YG,'*')	
% ------------------------------------------------------	
%			MOSTRA I RISULTATI
% ------------------------------------------------------

% 		fprintf('A  = %5.2f \n', A)
% 		fprintf('XG = %5.2f \n', XG)
% 		fprintf('YG = %5.2f \n', YG)
%       in alternativa
  		fprintf('area = %3.1f   XG =%5.2f   YG =%5.2f \n', A,XG,YG)

% ------------------------------------------------------	
%	     SCRITTE IN PAGINA GRAFICA
% ------------------------------------------------------

		text(x(1),y(1),'    1','fontsize',18,'fontname','times')
		text(x(2),y(2),'    2','fontsize',18,'fontname','times')
		text(x(3),y(3),'    3','fontsize',18,'fontname','times')
		text(x(4),y(4),'    4','fontsize',18,'fontname','times')
		text(XG,YG,'    G','fontsize',18,'fontname','times')

% ----------------------- FINE ----------------------

