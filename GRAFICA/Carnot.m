%  il programma illustra il ciclo di Carnot (termodinamica) 
%  Ciclo di Carnot
   clear all
   close all, clc
%  ------------ attiva grafica --------------
   hh=figure;
   set(hh, 'Units', 'normalized');
   set(hh, 'Position', [5  5  0.5  0.45]);
   whitebg(hh, 'white')
   hold on,  grid on , zoom on
%  --------------- dati --------------------
   V1 = 1; V2 = 4;  % volumi estremi 
   N = 100;         % numero suddivisioni
   h = (V2-V1)/N;   % passo
   v = V1:h:V2;     % vettore volumi
   c = 1.4;         % per le adiabatiche
   
%  isoterme in rosso
   for B = 10: 10 :50
     pt = B ./ v ;  % vettore pressioni isoterme
     plot(v,pt,'r') % traccia funzione
   end
   
%  adiabatiche in nero 
   va = v .^ c;
   for A = 10: 10 :50
     pa = A ./ va ; % vettore pressioni adiabatiche
     plot(v,pa,'k') % traccia funzione
   end

%  ------------------------------------------