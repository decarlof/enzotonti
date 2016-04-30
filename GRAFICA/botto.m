%-------------------------------------------------------------- inizio ---------
%              prova_bottoniere
%-------------------------------------------------------------------------------
% Questo programma vuole mostrare come fare le bottoniere.
% Il punto di partenza e' l'apertura di una finestra grafica
% ed, eventualmente, il tracciamento di un disegno, 
% in questo caso,una funzione.	
% Viene quindi creata una bottoniera.
%	Le decisioni prese premendo alcuni bottoni vengono prese da
% un programma chiamato "fiore.m". Questi bottoni sono quelli che
% hanno come ultima stringa   "  'callback','fiore'  "

%-------------------------------------------------------------------------------
	clc
% traccia il grafico di una funzione	
	close  % chiude eventuale finestra grafica precedente
 	h1=figure(1);  % attiva la pagina grafica 
% 	"h1" e' il "manico" o "gancio" per potersi riferire alla finestra
% 	con le caratteristiche che sono spiegate qui sotto:
	set(h1,'units','normalized','position',[0.5  0.5  0.5 0.5]);
  	whitebg(h1, 'black')
% 	axis [ Xmin   Xmax   Ymin   Ymax ]
	axis( [-10 10 -5  5] ) 
%-------------------------------------------------------------------------------
% traccia funzione
	a=1;  % valore di un parametro
	x = -10 : 0.01 : 10 ;  	% crea un vettore delle "x"
	y = x .* sin(a*x) ; 	% crea il corrispondente vettore delle "y"
	h2=plot(x,y,'y');  % traccia il grafico
%	-----------------------------------------------------------
% 	Quando si vuole esibire una scritta, una didascalia, un avviso, si usa
%	un bottone di tipo "static text". La scritta da riportare 
%	l'abbiamo messa come stringa e chiamata "messaggio"
% 	<STATIC TEXT>
	messaggio='fai click col cursore nella finestra e dopo premi return o click';
   	t1=uicontrol(...
		'style','text',...
	  	'Units','normalized', 'position',[0.1 0.002 0.35 0.08],...
   		'fontname','times', 'fontsize',14,...
	  	'horizontalalignment','center', 'string',messaggio,... 		
	  	'ForegroundColor',[1 0 0], 'BackgroundColor',[0 1 0]);
%	-----------------------------------------------------------
% 	<STATIC TEXT>
   	t2=uicontrol(...
		'style','text',...
	  	'Units','normalized','position',[0.03 0.84 0.2 0.05],...
   		'fontname','times','fontsize',14,...
	  	'horizontalalignment','center','string','colore',... 		
	  	'ForegroundColor',[1 0 0],'BackgroundColor',[0 1 0]);
%	-----------------------------------------------------------
% 	<POP UP> menu' a tendina: si aprono delle caselle
	p1=uicontrol('style','popup',...
        	'string','rosso|verde|azzurro',...
        	'Units','normalized', 'position',[0.03 0.80 0.2 0.05],...
        	'fontname','times', 'fontsize',14,...
		'callback','fiore');  % <----------- chiama un m.file
%-------------------------------------------------------------------------------
% 	Quando si vuole introdurre un numero o una stringa
%  	si usa il bottone di tipo "editable text". 
%-------------------------------------------------------------------------------
% 	<EDITABLE TEXT>
% 	"e1" e' una maniglia "handle"  
% 	(ricorda "handle with care" = maneggiare con cura) 
	e1=uicontrol(...
		'style','edit',... 			% "edit" per accettare una stringa
		'Units','normalized',... 		% misure normalizzate  
	  	'position',[0.5 0.2 0.07 0.08],...% posizione e dimensioni
		'horizontalalignment','center',... 	% testo al centro del bottone
	  	'fontname','times',...   	% tipo di carattere
	  	'fontsize',18,...		% dimensione del carattere
		'BackgroundColor','y',...% colore dello sfondo del bottone
 		'ForegroundColor','r',...% colore dello sfondo del bottone
      		'string',a,...  		% numero (se stringa mettere fra apici)
      		'callback','fiore'); 	% "fiore" e' il nome del programma chiamato
%-----------------------------------------------------------
%   <RADIO BUTTON> vale 0/1 SI tratta di un cerchietto che, se premuto
%	vale 1 e si forma una cerchietto nero al centro; se ripremuto il cerchietto si
% 	svuota e vale 0.
	radio1=uicontrol('style','radio',...
         	'string','conferma',...
		'Units','normalized',  'position',[0.5 0.80 0.15 0.05],...
		'fontname','times', 'fontsize',14,...
		'callback','fiore');  % <----------- chiama un m.file
%-----------------------------------------------------------
% 	<SLIDER>		 
	s1=uicontrol(...
		'style','slider',...
		'units','normal', 'position',[0.1  0.85  0.8  0.2],...
		'string','cosa fa',...  % dove lo ha messo? 
		'min', 0, 'max',1,...
		'val',1,...  		% velore iniziale del cursore
		'callback','fiore'); 	
%-----------------------------------------------------------
%  	<PUSH BUTTON> vale 0/1		 
	c0=uicontrol(...
		'style','pushbutton',...
        		'string','continua',...
		'units','normal',...
		'position',[0.01  0.60  0.10  0.04],...
		'callback','fiore');  
	c1=uicontrol(...
		'style','pushbutton',...
        		'string','tratto punto',...
		'units','normal','position',[0.01  0.56  0.20  0.04],...
		'callback','fiore');  
	c2=uicontrol(...
		'style','pushbutton',...
        		'string','punteggiato',...
		'units','normal',...
		'position',[0.01  0.52  0.10  0.04],...
		 'callback','fiore');  
	c3=uicontrol(...
		'style','pushbutton',...
		'string','tratteggiato',...		
		'units','normal',...
		'position',[0.01  0.48  0.10  0.04],...
		'callback','fiore');  
 %-----------------------------------------------------------
% 	<PUSH BUTTON>		 
%	Push buttons generate an action with each press,  but do not remain in a pressed state.
% 	To activate a push button, click the mouse button on the object. 
%	Push buttons are useful when the action you want to
%	perform is not related to any other action executable by the user interface 
%	(for example, an  "OK" button).
 	b1=uicontrol(...
		'style','pushbutton',...
		'units','normal', 'position',[0.9  0.005  0.1  0.04],...
		'string','FINE', 'callback','close'); 
 %-------------------------------------------------------------------------------
 	delete h2
%	pause
% traccia funzione
	a=1;  % valore di un parametro
	x = -10 : 0.01 : 10 ;  	% crea un vettore delle "x"
	y = x .* sin(a*x) ; 	% crea il corrispondente vettore delle "y"
	h3=plot(x,y);  % traccia il grafico
	set(h3,'color',col);
%-------------------------------------------------------------- fine -----------	  

	  
	  