	function [z] = f_fede(u,v);

% chiamata da "RungeKutta0.m"

% derivata di:  y =  x * exp(-x)
    z = exp(-u)-v;