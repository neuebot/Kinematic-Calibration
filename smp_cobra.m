close all
clc

name = 'COBRA';
nj = 4;

% Nomminal Denavit-Hartenberg parameters and link distances
l = [0.205 0.4 0.25];
% DH: [a, alpha,    d, theta] 
dhr = [l(2)	 0      l(1)	0;
       l(3)  0      0       0;
       0     0      0       0;
       0     0      0       0];

start_angle = [0, 0, 0, 0];
test_angle = [21 -32 76 -21];
plot = true;

flag = [0 0 1 0];
eedisp = zeros(nj, 3);
eedisp(3,:) = [0.1 0 0];
  
[Ar, An] = main(name, nj, dhr, start_angle, flag, eedisp, test_angle, plot);

Ar
An