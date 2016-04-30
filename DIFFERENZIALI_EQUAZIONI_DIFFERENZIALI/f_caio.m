function [z] = f_caio(u,v);
% chiamata da "Eulero.m"
% chiamata da  "Eulero_migliorato.m"
% chiamata da "quattroMetodi.m"
% derivata di:  y =  x * exp(-x)  
% e' y'=exp(-x) - x exp(-x)
	z =  exp(-u)-v; 