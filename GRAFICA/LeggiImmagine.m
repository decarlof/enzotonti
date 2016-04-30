	close; clc
	h=figure;	
% 	set(h,'Units','normalized','Position',[0 0 1 1]);
	set(h,'Units','pixel');  
	zoom on
%-----------------
	G=imread('pinco.jpg');
	image(G)
	
%-----------------
	[x,y] = ginput(2);
% 	scrive sullo schermo
	fprintf(' x=%3.0f   y=%3.0f  \n', x,y);
 
  	Firenze = fopen ( 'Crisman.txt' , 'wt');
  	fprintf ( Firenze , '%3.0i  %3.0i  \n' ,  x,y );
  	fclose (Firenze);

% Per vedere il file cosi' creato puoi usare un editor di testo.