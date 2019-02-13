close all
clc

name = 'KUKA';
nj = 7;

%Denavit-Hartenberg parameters 7 DoF
l = [0.34 0.4 0.4 0.126];
%DH: [a, alpha,    d, theta] 
dhr = [0 -pi/2	 l(1)    0;
      0	  pi/2      0    0;
      0	  pi/2   l(2)	 0;
      0  -pi/2      0    0;
      0  -pi/2   l(3)    0;
      0   pi/2      0    0;
      0      0   l(4)    0];

start_angle = [90, -90, 0, -90, 0, 90, 0];
test_angle = zeros(1,7);
plot = true;

flag = [0 0 0 0 0 0 0];
eedisp = zeros(nj, 3);

main(name, nj, dhr, start_angle, flag, eedisp, test_angle, plot);