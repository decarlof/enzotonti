%  puntoRetta.m
% Dato un segmento AB, considerata la retta r passante per i due punti
% assegnato un punto P il programma determina 
%  la proiezione di un punto sulla retta
%  valuta la distanza 
% e indica se la proiezione e' interna al segmento AB
   clc
	clf
	h1=figure(1);
	set(h1,'units','normalized','position',[0.5  0.5  0.5 0.45]);
	axis equal
	axis([0  100 0 80]);
	hold on
	
	xA=20; yA= 10;
	xB=50; yB= 60;
	
	plot(xA,yA,'ko','era','back');	text(xA,yA,'  A','era','back');
 	plot(xB,yB,'ko','era','back');	text(xB,yB,'  B','era','back');
	line([xA xB],[yA  yB], 'color','k');
 	
	L=sqrt((xB-xA)*(xB-xA)+(yB-yA)*(yB-yA));
	coseno= (xB-xA)/L;
	seno= (yB-yA)/L;
%-----------------------------------------------------------
% 	xP=1;
% 	title('per finire click sull''ascissa negativa');
% 	
%    while xP>0
	[xP  yP]=ginput(1);
 	plot(xP,yP,'k*','era','back');	
% equazione retta AB  (0<= s <= 1)
% 		x=xA+s*(xB-xA);   
%		y=yA+s*(yB-yA);	
% equazione retta perpendicolare per P ( t arbitrario)
% 		x=xP+t*seno;   
%		y=yP-t*coseno;	
% intersezione
%	xA+s*(xB-xA)=xP+t*seno;  ;  
% 	yA+s*(yB-yA)=yP-t*coseno;	
% sistema
%  	s*(xB-xA)  - t*seno 	  =	xP-xA;     
%  	s*(yB-yA) + t*coseno =	yP-yA;	
% matrice coefficienti
	A=[	xB-xA  	-seno 
		yB-yA   	coseno]; 
% termine noto
	b=[xP-xA; yP-yA];
% risoluzione	
	z= A\b;
 	s=z(1); t=z(2);
% proiezione Q
	xQ=xA+s*(xB-xA);
	yQ=yA+s*(yB-yA);
	plot(xQ,yQ,'k*','era','back');	
	line([xP xQ],[yP  yQ], 'color','k','era','back');
	
	fprintf(1,'distanza %g  s= %g  \n', t,s);
% end
	
	
	
	
	