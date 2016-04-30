%	==============================
%      		linee di livello
%	==============================
% 	Dato un insieme di triangoli, assegnamo a ciascun vertice 
%	il valore di una funzione, ad esempio la temperatura. 
% 	Ci proponiamo di tracciare le linee di livello, 
%	cioe' le linee lungo le quali la funzione è costante.
 	close; clear all; clc;
	h=figure(1);
	whitebg(h,'k')
	set(h,'units','normalized', 'position',[0.1 0.9 0.9 0.9]);
%	set(h,'units','normalized', 'position',[0  0  1  0.9]);
	axis([0  7    0   5])
	grid on 
	hold on
	rotate3d
%	--------------------------------------------------------------------
% 	di ogni triangolo assegnamo i tre vertici  (nodi)
	E = [1  	2   	3     % triangolo 1, nodi 1,2,3
		2	4	3	% triangolo 2, nodi 2,4,3
		2	5	4];	% triangolo 3, nodi 2,5,4
	emax=size(E,1);	% numero triangoli
%	--------------------------------------------------------------------
%	di ogni nodo assegnamo le coordinate x,y
	N(1,1)=1; N(1,2)=1;
	N(2,1)=4; N(2,2)=2;
	N(3,1)=2; N(3,2)=4;
	N(4,1)=5; N(4,2)=5;
	N(5,1)=6; N(5,2)=1;
%	--------------------------------------------------------------------
%	ad ogni nodo assegnamo il valore della funzione
	F =[ 45   42  35   33   32]';
%	--------------------------------------------------------------------
% 	X=N(:,1);  Y=N(:,2);  
% 	nome=trisurf(E,X,Y,F)
% 	 view(3)
% 	 set(nome,'edgecolor','interp','facecolor','interp')


%	Ora il programma esamina un triangolo alla volta e
%	traccia le linee di livello nel suo interno usando il passo "p"
%
% 		DA QUI IN AVANTI E' TUTTO PRONTO
%
	p  = 1; % 	passo
	for e = 1 :  emax
	 	h=E(e,1); i=E(e,2);	j=E(e,3);	% tre vertici
		X(1)=N(h,1); 	Y(1)=N(h,2); 	% coordinate dei tre vertici
		X(2)=N(i,1); 	Y(2)=N(i,2); 
		X(3)=N(j,1); 	Y(3)=N(j,2); 
 		line([X(1) X(2)] , [Y(1) Y(2)] , 'color', 'y');	% triangolo
		line([X(2) X(3)] , [Y(2) Y(3)] , 'color', 'y');	
		line([X(3) X(1)] , [Y(3) Y(1)] , 'color', 'y');
%		--------------------------------------------------
%		calcola e traccia le linee di livello
%		--------------------------------------------------
%		Valori funzione nei vertici del triangolo
 		G(1)=F(h);	G(2)=F(i);	G(3)=F(j);
% 		trova Gmin, Gint, Gmax
%		D è il vettore riordinato
% 		"m" e' un array che indica  la posizione originale
% 		dei valori di G in ordine crescente.
% 		m(1) è la posizione dell'elemento minimo
% 		m(2) è la posizione dell'elemento intermedio
% 		m(3) è la posizione dell'elemento massimo
		[D,m]=sort(G);	% ordina i vertici 
	 	for k=1:3 		% scambia le coordinate
	 		XD(k)=X(m(k));	 YD(k)=Y(m(k)) ;
		end 
% 		cerca i valori interi "n1", "n2", "n3" del contatore 
% 		troncando all'intero inferiore
		n =floor(D/p);  	
%		Dal vertice con valore della funzione minore 
%		a quello con valore intermedio
 		for k=(n(1)+1):n(2)
 			s = (k*p-D(1)) / (D(2)-D(1)); 	% min - interm
			xa = XD(1)+s*(XD(2)-XD(1)); 	% min - interm
			ya = YD(1)+s*(YD(2)-YD(1)); 	% min - interm
		
			t = (k*p-D(1)) / (D(3)-D(1)); 		% min - max
			xb = XD(1)+t*(XD(3)-XD(1)); 	% min - max
			yb = YD(1)+t*(YD(3)-YD(1)); 	% min - max
		
			line([xa xb] , [ya yb] ,[0 0] , 'color', 'c');	
		end	
 %		Dal vertice con valore della funzione intermedio 
%		a quello con valore massimo
		for k=(n(2)+1): n(3) 
 			u = (k*p-D(2)) / (D(3)-D(2));  	% interm - max
			xa = XD(2)+u*(XD(3)-XD(2));  	% interm - max
			ya = YD(2)+u*(YD(3)-YD(2));  	% interm - max

			t = (k*p-D(1)) / (D(3)-D(1)); 		% min - max
			xb = XD(1)+t*(XD(3)-XD(1));	% min - max
			yb = YD(1)+t*(YD(3)-YD(1));	% min - max
	
			line([xa xb] , [ya yb] ,[0 0] , 'color', 'c');	
		end	
	end

	
 