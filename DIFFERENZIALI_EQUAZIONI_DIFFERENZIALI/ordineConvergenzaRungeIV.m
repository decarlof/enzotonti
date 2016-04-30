%  -----------------------------------------------------------------
%      				  Runge4Convergenza
%
%	               E' confermato il quarto ordine
%
%     Integrazione dell'equazione dei moti armonici
%         con il metodo di Runge-Kutta II ordine e con altri
%	richiama: f_armonico
%  moto armonico smorzato con x(0)=0
%	x(t) = A*exp(-D*t)*sin(w*t); 
%	v(t) = -D*A*exp(-D*t)* cos(w*t)+A*w*exp(-D*t)*cos(w*t); 
%	v(0) = A*w;  
%  -----------------------------------------------------------------
	clear all
%  	close ;    
 	global  A  c  k  m	  
%  ------------------ GRAFICA ----------------------------
 	h1 = figure(3);
 	set(h1, 'Units', 'normalized', 'Position', [0.5 0.5 0.5 0.5]);
	whitebg(h1, 'k')
    	title('Runge4ConvergenzaOK');
%   scrivi sugli assi 
	xlabel('log(PASSO)   (base10)')
 	ylabel('log(ERRORE)  (base10)')
%   colore degli assi ( gca = g-et c-urrent a-xis handle)  
	set (gca,'XColor','w', 'YColor','w' )
	hold on ; zoom on; grid on
%  -------------------- DATI  FISICI ------------------------------
	m = 1;				% 	massa 
    	k = 40;				%	rigidezza
	c = 0.5;			% 	coefficiente di smorzamento
	D = c / (2*m);
    	A = 10; 			%	ampiezza
    	w = sqrt(k / m-D*D); 	%	pulsazione
	Tin=0; Tfin = 10;	% intervallo [0,Tfin]
%  -----------------------------------------------------------------
%  		Runge-Kutta IV  
%  -----------------------------------------------------------------
%  Dx1 = Dt f(T(n), X(n)) 
%  Dx2 = Dt f(T(n)+Dt /2, X(n)+Dx1 /2)
%  Dx3 = Dt f(T(n)+Dt /2, X(n)+Dx2 /2)  
%  Dx4 = Dt f(T(n)+Dt,  X(n)+Dx3)
%  X(n+1)=X(n)+(Dx1+2*Dx2+2* Dx3+Dx4)/6
%	e analoghe per la P
% 
% 	suddivisioni
	N=100; % suddivisioni in partenza
	for i=1 : 4
		E(i)=0; % memorizza errore massimo
		h =(Tfin-Tin)/N;% passo di integrazione
		H(i)=h; % memorizza passo
% 		assegna valori iniziali
  		X(1) = 0;			%  posizione iniziale
  		P(1) = m*A*w;  	%  quantitˆ di moto iniziale
		T(1) = Tin;
  		for n = 1 : N-1
%			incremento con la derivata nel punto INIZIALE
 			[Dx1,Dp1] = f_armonico (h, T(n), X(n), P(n));
%			incremento con la derivata nel punto medio
  			[Dx2,Dp2] = f_armonico (h, T(n)+h/2, X(n)+Dx1/2, P(n)+Dp1/2);
%			incremento con la derivata nel punto medio
  			[Dx3,Dp3] = f_armonico (h, T(n)+h/2, X(n)+Dx2/2, P(n)+Dp2/2);
%			incremento con la derivata nel punto FINALE
  			[Dx4,Dp4] = f_armonico (h, T(n)+h, X(n)+Dx3, P(n)+Dp3);
%			media pesata degli incrementi
   			Dx  = (Dx1+2*Dx2+2*Dx3+Dx4)/6;
			Dp  = (Dp1+2*Dp2+2*Dp3+Dp4)/6	;
  			X(n+1) = X(n) + Dx;
			P(n+1)  = P(n) + Dp; 
			T(n+1) = T(n) + h;
%    		soluzione esatta 
			Xe(n+1) = A * exp(-D*T(n+1)) .* sin(w*T(n+1)); 
			err = abs(X(n+1)-Xe(n+1));
			if err > E(i)  
				E(i) = err;
			end
		end
		fprintf('H= %6.4f  errmax= %10.6f\n',H(i),E(i))
   		N=N*2;
 	end
%-----------------------------------------------
	X=log10(H); % logaritmo decimale passo	
 	Y=log10(E); % logaritmo decimale errore
 	plot(X,Y,'y*')
% 	"polyfit" determina l'inclinazione e l'intercetta y della retta
	pR=polyfit(X,Y,1); % array a 2 valori 
  	p=real(pR(1));  	
   	q=real(pR(2));  	
%  	traccia una retta
   	XX =X(4):0.1:X(1);  
	YY = q + p .* XX;	
  	plot(XX,YY,'y'); % retta
	fprintf(' ordine %6.4f \n', p)
% 	scrivi sul grafico l'ordine di convergenza
	pp=num2str(p); % converti il numero in stringa
	xa=(X(2)+X(3))/2;xb=(Y(2)+Y(3))/2; % coordinate punto conveniente
	text(xa,xb,['   ordine= '   pp],'color','y' );
%==============================================