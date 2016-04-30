%  retta per due punti (retta.m)
   close
   h1 = figure(1);  	
   set(h1, 'Units', 'normalized');
   set(h1, 'Position', [0.5 0.5  0.5  0.5]);
   whitebg(h1, 'w')
   axis equal ;  axis on ;  grid on   
   hold on
   axis([0 6 0 6] ); % [xmin xmax ymin ymax]
%  ----------------------------------------
   xA=2; yA=1; xB=5; yB=4;
   plot(xA,yA,'k*');    text(xA,yA,'  A','fontsize',18)
   plot(xB,yB,'k*');    text(xB,yB,'  B','fontsize',18)
   
   t = (-1 : 0.1 : 2);
   x = xA + (xB - xA)*t;
   y = yA + (yB - yA)*t;
   plot(x,y,'k')