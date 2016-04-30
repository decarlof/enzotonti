%---------------------- PITAGORA ---------------------
%----------------creato il 28/3/2001------------------
%------------------da Puntar Marko--------------------
%-----------------------------------------------------
clear all;
clc;
close;
%---------------------- grafica ----------------------

h1 = figure(1);
set(h1,'Units', 'normalized', 'Position', [0 0 1 0.94]);
hold on
pause on
axis equal; axis([-5 8 -4 8]);
whitebg(h1, 'black')
h2=title('Teorema di Pitagora');
set(h2,'fontsize',24,'color','w','fontname','times');
set(gca,'XTick',[0:0:0],'YTick',[0:0:0],'Xcolor','k','Ycolor','k');%evita di visualizz.gli assi

ritardo = 8000;  % rallenta le animazioni




X = [0 3 3 0]; Y = [0 0 4 0];     % vettore rappresentativo il triangolo(lati 3,4,5)
X1 = [0 0 4 0]; Y1 = [0 -3 -3 0]; %    "            "       il tr.second.1
X2 = [3 7 7 3]; Y2 = [4 4 1 4];   %    "            "       il tr.second.2
QaX = [0 0 3 3 0];    QaY = [0 -3 -3 0 0]; % quadrato di lato la base(a)
QbX = [3 7 7 3 3];    QbY = [0 0 4 4 0];   % quadrato di lato l'altezza(b)
QcX = [0 3 -1 -4 0]; QcY = [0 4 7 3 0];   % quadrato di lato l'ipotenusa(c)

line([X],[Y],'linewidth',2,'color','y','era','back') % traccia il triangolo
pause; fill(QaX, QaY, 'r', 'era', 'back');   % disegna i quadrati
pause; fill(QbX, QbY, 'g', 'era', 'back');
pause; fill(QcX, QcY, 'c', 'era', 'back');
plot(X,Y,'y','era','back') 

%---- animazione quadrato a ----

% stiramento lungo asse X
pause
for A = 0:0.1:4;
   Xa = [0 3 A+3 A 0]; Ya = [0 0 -3 -3 0];
   Xcanc = [0 A 0 0]; Ycanc = [0 -3 -3 0];
   fill(Xcanc,Ycanc,'k','era','back')
   fill(Xa,Ya,'r','era','back')
      for retard = 0:ritardo;   % rallenta l'animazione
      end   
end

%- -scritte tr.princ.- -
txta=text(1.5,0.4,'a','era','back');
txtb=text(2.5,2,'b','era','back');
txtc=text(1.5,1.7,'c','era','back');
set(txta,'fontsize',24,'color','c','fontname','times');
set(txtb,'fontsize',24,'color','c','fontname','times');
set(txtc,'fontsize',24,'color','c','fontname','times');

pause
TR1=plot(X1,Y1,'c','era','back');      %traccia tr.second.1

%- -scritte tr.second.1- -
txta1=text(-0.4,-1.5,'a','era','back');
txtb1=text(1.7,-2.7,'b','era','back');
txtc1=text(1.5,-1.5,'c','era','back');
set(txta1,'fontsize',24,'color','y','fontname','times');
set(txtb1,'fontsize',24,'color','y','fontname','times');
set(txtc1,'fontsize',24,'color','y','fontname','times');
pause
delete(txta,txtb,txtc,txta1,txtb1,txtc1,TR1) %cancella scritte e tr.second.1

% raddrizzamento lati
pause
for Ix = 3:-0.048:1.08;
   Iy = 3/4*(3-Ix);
   Xa = [0 Ix Ix+4 4 0]; Ya = [0 Iy Iy-3 -3 0];
   Xcanc = [4 Ix+4 7 4]; Ycanc = [-3 Iy-3 -3 -3];
   fill(Xcanc,Ycanc,'k','era','back')
   fill(Xa,Ya,'r','era','back')
      for retard = 0:ritardo;   % rallenta l'animazione
      end   
end

% spostamento
pause
for Sx = 0:-0.1:-4;
   Sy = -3/4*Sx;
   Xa = [Sx Sx+Ix Sx+Ix+4 Sx+4 Sx]; Ya = [Sy Sy+Iy Sy+Iy-3 Sy-3 Sy];
   Xcanc = [Sx+Ix+4 7 4 Sx+4 Sx+Ix+4]; Ycanc = [Sy+Iy-3 -3 -3 Sy-3 Sy+Iy-3];
   fill(Xcanc,Ycanc,'k','era','back')  %cancella la parte dietro al rettangolo in movimento
   if (Sx+Ix+4)<3   % devo ridisegnare il tratto in vista della base a      
      plot([3 (3+(Sx+Ix+1)*25/16)],[0 0],'y','era','back')
   end
   fill(Xa,Ya,'r','era','back')
      for retard = 0:ritardo;   % rallenta l'animazione
      end   
end
plot(QaX,QaY,'r','era','back')
line([X],[Y],'linewidth',1,'color','y','era','back') % ripristina il triangolo



%---- animazione quadrato b ----

% stiramento lungo asse Y
pause
for A = 0:-0.075:-3;
   Xa = [3 3 7 7 3]; Ya = [0 4 A+4 A 0];
   Xcanc = [3 7 7 3]; Ycanc = [4 4 A+4 4];
   fill(Xcanc,Ycanc,'k','era','back')
   fill(Xa,Ya,'g','era','back')
      for retard = 0:ritardo;   % rallenta l'animazione
      end   
end

%- -scritte tr.princ.- -
txta=text(1.5,0.4,'a','era','back');
txtb=text(2.5,2,'b','era','back');
txtc=text(1.5,1.7,'c','era','back');
set(txta,'fontsize',24,'color','c','fontname','times');
set(txtb,'fontsize',24,'color','c','fontname','times');
set(txtc,'fontsize',24,'color','c','fontname','times');

pause
TR2=plot(X2,Y2,'c','era','back');      %traccia tr.second.2
%- -scritte tr.second.2- -
txta2=text(7.1,2.6,'a','era','back');
txtb2=text(5,4.3,'b','era','back');
txtc2=text(5.25,2.7,'c','era','back');
set(txta2,'fontsize',24,'color','y','fontname','times');
set(txtb2,'fontsize',24,'color','y','fontname','times');
set(txtc2,'fontsize',24,'color','y','fontname','times');
pause
delete(txta,txtb,txtc,txta2,txtb2,txtc2,TR2) %cancella scritte e tr.second.2



% raddrizzamento lati
pause
for Ix = 3:-0.048:1.08;
   Iy = 3/4*(3-Ix);
   Xa = [Ix 3 7 Ix+4 Ix]; Ya = [Iy 4 1 Iy-3 Iy];
   Xcanc = [7 Ix+4 7 7]; Ycanc = [1 Iy-3 -3 1];
   fill(Xcanc,Ycanc,'k','era','back')
   fill(Xa,Ya,'g','era','back')
      for retard = 0:ritardo;   % rallenta l'animazione
      end   
end

% spostamento
pause
for Sx = 0:-0.1:-4;
   Sy = -3/4*Sx;
   Xa = [Sx+Ix Sx+3 Sx+7 Sx+Ix+4 Sx+Ix]; Ya = [Sy+Iy Sy+4 Sy+1 Sy+Iy-3 Sy+Iy];
   Xcanc = [Sx+7 7 7 Sx+Ix+4 Sx+7 7]; Ycanc = [Sy+1 1 -3 Sy+Iy-3 Sy+1 1];
   fill(Xcanc,Ycanc,'k','era','back')  %cancella la parte dietro al rettangolo in movimento
   if (Sx+Ix+4) < 3
      plot([3 3],[0 (-(Sx+Ix+1)*25/12)],'y','era','back')
   end
   fill(Xa,Ya,'g','era','back')
      for retard = 0:ritardo;   % rallenta l'animazione
      end   
end
plot(QbX,QbY,'g','era','back')
line([X],[Y],'linewidth',2,'color','y','era','back') % ripristina il triangolo


%line([QcX],[QcY],'linewidth',5,'color','c','era','back'); % incornicia il quadrato
%pause(1)
%line([QcX],[QcY],'linewidth',5,'color','k','era','back'); % ...lampeggio
%line([X],[Y],'linewidth',2,'color','y','era','back') % ripristina il triangolo
pause(1)
fill(QcX, QcY, 'c', 'era', 'back');% disegna il quadrato c*c celeste
pause(1)
text(4.6,-3.8,'realizzato da Puntar Marko','era','back');