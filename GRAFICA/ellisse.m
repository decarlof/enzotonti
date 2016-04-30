%  	             ELLISSE
% Traccia una ellisse usando le coordinate polari
%	---------- attiva la grafica--------------------------------------------------------
  close ; h1 = figure(1); 	
  set(h1, 'Units', 'normalized', 'Position', [0  0  1  0.9]) ; 
  whitebg(h1,'black')
  axis equal ; axis([-12  12  -10  10]);
  hold on ; zoom on
  title('premere un tasto ...','fontsize',18)
% ----------------- parametri --------------------------------------------------------
  a = 10;             % semiasse maggiore
  c = 8;              % semidistanza focale
  b = sqrt(a^2-c^2);  % semiasse minore
  p = b^2 /a;         % parametro della conica=ordinata nel fuoco
  e = c/a;            % eccentricita'
% ----------------- conica ----------------------------------------------------------
  Th = 0 : 0.01 : 2*pi;                   % array dei valori discreti di theta
  R = p ./ (1 + e*cos(Th));               % array dei valori discreti di rho
  X = c+ R .* cos(Th);  Y = R .* sin(Th); % array  coordinate cartesiane
  plot(X,Y,'r','linewidth',2); 
% ----------------- fuochi, centro, assi, ecc. --------------------------------------	
  plot(c,0,'r+','linewidth',2);                              % fuoco
  plot(-c,0,'r+','linewidth',2);                             % fuoco
  plot(0,0,'r+','linewidth',2);                              % centro
  text(-c+0.61, 0.8,'F''','fontsize',18,'fontname','times'); % fuoco
  text(0, 0.8,'C','fontsize',18,'fontname','times')          % centro
  text(c, 0.8,'F','fontsize',18,'fontname','times');         % fuoco
  plot([-10 10],[0  0],'color','g', 'linestyle', ':');       % asse maggiore
  plot([0 0],[-b  b],'color','c', 'linestyle', ':');         % asse minore
  plot([-c  -c],[0  p],'color','c', 'linestyle', ':');       % ordinata nel fuoco
% ----------------- raggi focali ----------------------------------------------------	
  for th = 0 : 0.16 : 2*pi;                 % discretizza angolo theta
    r = p / (1+e*cos(th));                  % raggio
    x = c+r*cos(th);  y = r*sin(th);        % coordinate cartesiane
    plot([c  x],[0  y],'y','era','back')
   
  end
% ----------------- fine ------------------------------------------------------------	