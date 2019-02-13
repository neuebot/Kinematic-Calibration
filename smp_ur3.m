close all
clc

name = 'UR3';
nj = 6;

%https://www.universal-robots.com/how-tos-and-faqs/faq/ur-faq/parameters-for-calculations-of-kinematics-and-dynamics-45257/
% Different because we changed the orientation of the base X axis
% Nominal Denavit-Hartenberg parameters and link distances
l = [0.1519 0.24365 0.21325 0.11235 0.08535 0.0819];
% DH: [a, alpha,    d, theta] 
dhr = [ 0    -pi/2	 l(1)    0;
       l(2)   0      0       0;
       l(3)   0      0   	 0;
        0    -pi/2   l(4)    0;
        0     pi/2   l(5)    0;
        0     0      l(6)    0];

start_angle = [0, 0, -90, 0, 90, 0];
test_angle = [32, -62, 60, -22, 02, 12];
plot = true;
  
flag = [0 0 0 0 0 0];
eedisp = zeros(nj, 3);

[Ar, An] = main(name, nj, dhr, start_angle, flag, eedisp, test_angle, plot);
Ar
An