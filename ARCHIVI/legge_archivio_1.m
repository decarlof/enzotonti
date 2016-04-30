 %=== INIZIO ====================================================
 %                            legge_archivio_1
 %
 %    Leggere su un archivio di testo una tabella di dati.  
 % Legge l'archivio generato da 'arch_1.m'
 %---------------------------------------------------------------
 		clear  % elimina tutte le variabili in memoria
		clc     % pulisce la finestra dei comandi
 		disp('Come prelevare una matrice da un file.')
 % Il nome esterno del file   "giovanni.txt" 
 % e' stato generato dal programma "arch_1.m"   
 % Il nome deve essere posto entro apici perche' e' una stringa.
 % Si apre il file assegnandogli il nome interno "Bologna" 
 % in lettura  ( 'r'  che sta per "read" ).
  		qq = fopen ( 'giovanni.txt' , 'r');
 % Si preleva dall'archivio "qq" la matrice "M"
 % leggendo le due colonne di numeri 
 % in formato esponenziale "%g"
 		M = fscanf ( qq , '%e' ,  [2 inf] );
 % Si noti che per primo si mette il nome interno: (qq)
 % per secondo si mette il formato ('%e %e')
 % per terzo si mette il numero di elementi per riga (2)
 % e, non sapendo quante righe sono, si mette (inf) 
 % il tutto entro parentesi quadre per indicare la matrice 
 % Quindi si chiude il file
  		fclose (qq);
 % La tabella prelevata e'
 		disp('La matrice letta dal file e''  ') 
		M' 
		disp('Arrivederci e grazie')
 % Notare le corrispondenze 
 %	apre: 	fopen (...)			chiude: fclose (...)
 %  scrive: fprintf (...)		legge:	fscanf (...)
 %================================================ FINE =========