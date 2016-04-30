%--------------------------------------------------------------------------------
% 			SCAMBIATORE DI CALORE 
% 			(vedi prima: "cerc_1" e "cerc_2")
%--------------------------------------------------------------------------------
%				CALCOLA	
%--------------------------------------------------------------------------------
	clear
	clc
 	close
% separato il calcolo dalla grafica
% le misure sono in cm
	re = 190; 		% raggio esterno della corona
	ri = 110; 		% raggio interno della corona
	rm = (re+ri)/2;	% raggio medio della corona
	rf = 20; 		% raggio dei fori
% primo poligono regolare in senso antiorario (s = 1)
 	[A5, B4, n1] = cerchio(190, 190, re, 30, 1); 
% secondo poligono regolare in senso orario (s = -1)
 	[C5, D4, n2] = cerchio(190, 190, ri, 16, -1);	
% componi la matrice dei vertici
	Q1 = C5(:, 1)+n1; 
 	C5 = [Q1 C5(:, 2:5)];
  	Vert5 = [A5 ; C5]; 
% componi la matrice dei lati
	Q1 = D4(:, 1:3)+n1; 
 	D4 = [Q1 D4(:, 4:4)] ;
  	Lati4 = [B4 ; D4];
% totale vertici
	ntot = n1+n2  ;
%--------------------------------------------------------------------------------	
% Ora calcola i fori nella corona	
	m =8; % numero fori
	b = 2*pi/m; % angolo tra le mezzerie di due fori
 	for j = 1:m
 		xc = 190 + rm*cos(j*b);
		yc = 190 + rm*sin(j*b);
 		[C5, D4, n] = cerchio(xc, yc, rf, 6,-1); 
		% aggiusta "Vert5" e appendi
		Q1 = C5(:, 1) + ntot; 
		C5 = [Q1 C5(:, 2:5)];
		Vert5 = [Vert5 ; C5]; 
		% aggiusta "Lati4" e appendi
		Q1 = D4(:, 1:3)+ntot; 
		D4 = [Q1 D4(:, 4:4)] ;
		Lati4 = [Lati4 ; D4];
		% totale vertici
		ntot = ntot+n;
 	end
	if 0 == 1 	% <----- togliere l'end 
%--------------------------------------------------------------------------------
%				SALVA	
%--------------------------------------------------------------------------------
% Apre l'archivio "nome.d" e depone le due matrici (trasporre!)
	nome =  input('nome dell''archivio ','s');
	nome1  = [nome '.d'];
    	Firenze  =  fopen (nome1 , 'wt');
    	fprintf ( Firenze ,'%i\n', n ); 
    	fprintf ( Firenze ,'%3i\t %5g\t %8g\t %3i\t %2i\n', Vert5');
	fprintf ( Firenze ,'%i\n', n ); 
   	fprintf ( Firenze ,'%3i\t%3i\t %3i\t %3i\n',Lati4');
     	fclose(Firenze);
%
%--------------------------------------------------------------------------------
%				MOSTRA quello che salva
%--------------------------------------------------------------------------------
   	fprintf ( 1,'%i\n', ntot ); 
     	fprintf ( 1,'%3i\t %5g\t %5g\t %3i\t %2i\n', Vert5' );
 	fprintf ( 1,'%i\n', ntot ); 
    	fprintf ( 1,'%3i\t%3i\t %3i\t %3i\n', Lati4'); 
%--------------------------------------------------------------------------------
 	end 		% <----- dell'if salta	

%--------------------------------------------------------------------------------
%				GRAFICA	
%--------------------------------------------------------------------------------
% Traccia il poligono: per chiudere occorre aggiungere
% una riga in fondo uguale alla prima.
% I due punti ":" indicano tutte le colonne
% (si poteva scrivere "A5(1,1:5)")
	G5 = [Vert5; Vert5(1,:)]; 
 % Disegna la poligonale a base di lati: il loro numero e' "lp"
	h2 = figure(1);
	hold on
%	set(h2, 'units', 'normalized', 'position', [0 0 1 1])	
	set(h2, 'units', 'normalized', 'position', [0.5 0.5 0.5 0.5])	
	whitebg('k');
% traccia il poligono regolare (chiuso)
 	for k = 1:ntot
		n1 = Lati4(k, 2)+1; % per evitare lo zero
		n2 = Lati4(k, 3)+1;	% per evitare lo zero
 		x1 = Vert5(n1, 2) ; y1 = Vert5(n1, 3) ;
		x2 = Vert5(n2, 2) ; y2 = Vert5(n2, 3) ;	
 		h = line([x1 x2], [y1 y2], 'color', 'g',  'linewidth', 2,'era','back');
	end
 	axis equal % <------ deve precedere "axis"
	axis([0  380 0 380]);
%------------------------------------------------------------ fine -------------
	if 0 == 1 	% <----- togliere l'end 
	end 		% <----- dell'if salta	