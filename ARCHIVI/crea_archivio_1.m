 %=== INIZIO ==================================================
 %                    crea_archivio_1
 % Mostra come salvare su un archivio di testo una tabella
 %     (per prelevare i dati salvati usare "arch_2.m")
 %------------------------------------------------------------
 		clear   % elimina tutte le variabili in memoria
		clc     % pulisce la finestra dei comandi
 		disp('  Come salvare una matrice M.')
 % Vogliamo salvare la tabulazione di una funzione ...
 % Si crea un vettore
     x = 1 : 0.1 : 2 ;   	
 % Si valuta una matrice M
     M = [ x ; sin(x)] ; 
 % che esibisco sullo schermo in forma trasposta
     M'
 %-----------------------------
 % Il nome esterno del file  sia "giovanni.txt" deve essere posto 
 % entro apici perche' e' una stringa.
 % Si apre il file in scrittura con 'wt' 
 % assegnandogli il nome interno "pp"
 % (su PC occorre usare  'wt' ( 'wt' sta per "write text") in 
 % quanto il "line feed" "\r" non e' incluso nel "new line" "\n")
     pp = fopen ( 'giovanni.txt' , 'wt');
 % Si deposita nell'archivio "pp" la matrice "M"
 % scrivendo le due colonne di numeri decimali:
 % la prima colonna con 8 cifre di cui 4 decimali
 % la seconda colonna 8 cifre di cui 4 decimali.
 % Si osservi che "fprintf" e' un acronimo di "file-print-formatted"		  
     fprintf ( '%6.2g  %8.4g  \n' ,  M );  % nessun file = sullo schermo
     fprintf ( pp , '%6.2g  %8.4g \n' ,  M );
 % Si noti che per primo si mette il nome interno: (pp)
 % per secondo si mette il formato:  '%6.2g  %8.4g   \n'
 % in cui "\n" indica di andare a capo ( new line )
 % e per terzo si mette la  matrice: M.
 % Quindi si chiude il file
     fclose (pp);
     disp('ho salvato la matrice M su un file') 
     disp('di nome ''giovanni.txt'' ') 

 % Per vedere il file cosi' creato usare un editor di testo.
 %================================================ FINE =====