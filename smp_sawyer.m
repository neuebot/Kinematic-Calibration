close all
clc

name = 'SAWYER1';
nj = 7;

% Nomminal Denavit-Hartenberg parameters and link distances
l = [0.317 0.081 0.1925 0.4 0.1685 0.4 0.1363 0.13375];
% DH: [a, alpha,    d, theta] 
dhr = [l(2)	-pi/2	l(1)    0;
       0     pi/2   l(3)    pi/2;
       0    -pi/2   l(4)	0;
       0     pi/2  -l(5)    0;
       0    -pi/2   l(6)    0;
       0     pi/2   l(7)    0;
       0     0      l(8)    0];

start_angle = [90, -90, 0, -90, 0, 90, 0];
test_angle = [-25 -123 62 -40 -54 32 25];
plot = true;
  
flag = [0 0 0 0 0 0 0];
eedisp = zeros(nj, 3);

main(name, nj, dhr, start_angle, flag, eedisp, test_angle, plot);