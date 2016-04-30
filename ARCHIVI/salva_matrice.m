%-------------------------------------------------------------------------------
%                            salva_matrice
% salva una matrice su un file chiamato "arturo.txt"
% quindi la torna a leggere 
%-------------------------------------------------------------------------------
%123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789
%-------------------------------------------------------------------------------
% Questo programma vuole far vedere come opera MATLAB
% nel leggere e nello scrivere una matrice.
	clc
	clear all
	disp('ATTENZIONE:')
	disp('se dichiara ''invalid fid'' vuol dire che "arturo"');
	disp('oppure "michela" sono aperti');
% La matrice sia indicata con P e data da
	P=[	1  2 3
		 4 5 6 ]; 
	disp('la matrice originaria era'); disp(P);
% quindi formata da 3 colonne e 2 righe. E' bene considerare
% prima il numero di colonne e poi il numero di righe.
% Infatti di solito le colonne sono poche e ben determinate
% mentre le righe sono tantissime e variabili.
% 	Per salvarla su un archivio in una forma leggibile
% con apertura diretta, ovvero che sia mantenuto
% l'aspetto colonne-righe della matrice data, si deve salvare 
% la TRASPOSTA mettendo come specifica il numero di colonne
% ... della matrice! in questo caso 3 colonne.
% Ora la salvo nel file 'arturo' con la specifica '%g %g %g\n' :
% ATTENZIONE: gli spazi nella stringa di formato sono essenziali!
	papavero = fopen('arturo.txt', 'wt');
	fprintf(papavero, '%g %g %g\n' , P' ); 
 	fclose(papavero);
% Ora andiamo a prelevare la matrice appena scritta: 
% dobbiamo almeno sapere quante colonne ha. In questo caso 3. 
% Non importa il numero di righe: basta scrivere "inf" .
% Si noti la differenza fra "fprintf" e "fscanf":
%------------------------------------------------------------
%		fprintf(nome, 'formato\n' ,M ); 
%	M =	fscanf(nome, formato, [colonne inf] ); 
%------------------------------------------------------------
	camomilla = fopen('arturo.txt', 'r');
	M=fscanf(camomilla, '%g %g %g' , [3 inf] ); % 3 colonne 
	fclose(camomilla); 
% Se non si mette il ";" dopo l' "fclose" sullo schermo viene scritto "ans 0" 
	disp('la matrice letta e'' '); disp(M);
	disp('come si vede l''ha trasposta!'); 
% Questo vuol dire che legge per righe e le scrive per colonne.
% Ovvero: quello che ha letto non e' la matrice giusta. Pertanto se
% si vogliono fare operazioni sulla matrice occorre prima trasporla.
% Ad esempio se si vogliono aumentare di 1 gli elementi delle prime
% due colonne occorre farlo sulla trasposta della matrice letta.
	disp('per lavorare la matrice originaria');
	disp('occorre fare la trasposta di quella letta'); 	
	N = M';
	N(:, 1:3) =N(:, 1:3)+1; 
 	disp(N)
%
% In conclusione: REGOLE OPERATIVE
% 1) lavorare sulla trasposta della matrice letta
% 2) salvare la trasposta con le specifiche della matrice data.
	disp('In conclusione: REGOLE OPERATIVE');
	disp('1) lavorare sulla trasposta della matrice letta');
	disp('2) salvare la trasposta con le specifiche della matrice data.');
%-------------------------------------------------------------------------------