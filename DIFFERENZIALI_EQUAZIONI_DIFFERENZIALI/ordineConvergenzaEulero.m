%================================================
%    				   Eulero
% 			confermato l'ordine 1
%
%  Integra l'equazione differenziale y'=f(x,y)
%  con il metodo di Eulero.
% 	e mostra l'ordine di convergenza
%------------------------------------------------
%	stampa i valori delle ordinate man mano che 
%	li calcola e mostra la discrepanza con il 
%	valore esatto
% 	elimina tutte le variabili in memoria 		
	clear; close;
	h2 = figure(1);
%	set(h2, 'units', 'normalized', 'position', [0 0 1 1])	
	set(h2, 'units', 'normalized', 'position', [0.5 0.5 0.5 0.5])	
	whitebg('black');
   title('EuleroConvergenzaOK');
% 	fissa e traccia gli assi	
%  	axis( [0  10  0   1.1] );  % [xmin xmax ymin ymax]
	xlabel('log(PASSO)   (base10)')
 	ylabel('log(ERRORE)  (base10)')
	hold on ; grid on; 
%-----------------------------------------------
% 	soluzione esatta:  			y = x*exp(x); 	y=1/x; 
%	equazione differenziale: 	y'= y ; 			y'=-y*y
%
%	intervallo di integrazione
	a=1;   b=10;
	N=100; % suddivisioni in partenza
 	for i=1:4  % raddoppia ogni volta il numero di suddivisioni
		E(i)=0; % memorizza errore massimo
		h=(b-a)/N;% passo di integrazione  
		H(i)=h; % memorizza passo
% 		assegna valori iniziali
		x=a; y=1/a; % <<<<<<<---------------------!
% 		soluzione approssimata (metodo di Eulero)	
		while x<b
%			---------------------------------
%			ye = x*exp(x);% soluzione esatta
% 			y = y + (exp(x)+y)*h;
%			---------------------------------
			ye = 1/x ;% soluzione esatta
  			y = y +(-y*y)*h;
%			---------------------------------
			% valuta errore massimo
			err=abs(y-ye);
			if err >E(i)
				E(i)=err;
			end		
			x=x+h;
		end
		fprintf('H= %6.4f  errmax= %10.6f\n',H(i),E(i))
		N=N*2;% raddoppia ogni volta il numero di suddivisioni
	end
%-----------------------------------------------
	X=log10(H); % logaritmo decimale passo	
 	Y=log10(E); % logaritmo decimale errore
 	plot(X,Y,'y*')
% 	"polyfit" determina l'inclinazione e l'intercetta y della retta
	pR=polyfit(X,Y,1); % array a 2 valori 
  	p=real(pR(1));  	
   q=real(pR(2));  	
%  traccia una retta
   XX =X(4):0.1:X(1);  
	YY = q + p .* XX;	
  	plot(XX,YY,'y'); % retta
	fprintf(' ordine %6.4f \n', p)
% 	scrivi sul grafico l'ordine di convergenza
	pp=num2str(p); % converti il numero in stringa
	xa=(X(2)+X(3))/2;xb=(Y(2)+Y(3))/2; % coordinate punto conveniente
	text(xa,xb,['   ordine= '   pp],'color','y' );
%==============================================
   	 
 
 