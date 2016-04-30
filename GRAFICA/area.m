% 	area triangolo
clc

	x1 = 0;  y1 = 0;
	x2 = 4;  y2 = 0;
	x3 = 0;  y3 = 4;
    
 	M = [1 x1 y1   
         1 x2 y2  
         1 x3 y3];
   
 	A = det(M)/2 