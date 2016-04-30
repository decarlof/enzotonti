%			IPERBOLICHE
%	Traccia le funzioni iperboliche  
%	-------------------------------------------------------------- 
%		                   attiva la grafica
%	--------------------------------------------------------------  
   close       
   h1 = figure;
% 	 set(h1, 'Units', 'normalized', 'Position', [0  0  1  0.9]);
 	 set(h1, 'Units', 'normalized', 'Position', [0  0  0.5  0.45]);
 	 whitebg(h1, 'black')
%
 	h2=title('funzioni iperboliche');
       set(h2,'color','w','fontsize',18,'fontname','helvetica') 
%
  	h3=xlabel('x');
  	set(h3,'color','c','fontsize',24)
%
  	h4=ylabel('y');
  	set(h4,'color','c','fontsize',24)
%
  	axis([-10 10 -10  10]);
	axis equal
	hold on
	grid on
%	---------------------- grafici ----------------------------
       X = -7.8 : 0.01: 7.8 ;
       Y = exp(X) ; 
 	Ys = (Y-1./Y)/2; 	  plot(X,Ys,'y','linewidth',2);
	Yc = (Y+1./Y)/2; 	  plot(X,Yc,'r','linewidth',2);
	Yt = Ys ./ Yc ; 	  plot(X,Yt,'w','linewidth',2);
	Ye = Y; 			  plot(X,Ye,'c','linewidth',2);
	Yp = 1 ./ Y; 		  plot(X,Yp,'g','linewidth',2);
	Yx = X; 			  plot(X,Yx,'k:','linewidth',2);
%	-----------------------------------------------------------
       text(-2,-7,'sinh(x)','color','y','fontsize',14)
       text(-7,7,'cosh(x)','color','r','fontsize',14)
       text(5,2,'tanh(x)','color','w','fontsize',14)
       text(-7,1,'exp(x)','color','c','fontsize',14)
       text(5,-1,'exp(-x)','color','g','fontsize',14)
   