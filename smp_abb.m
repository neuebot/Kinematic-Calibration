close all
clc

name = 'ABB';
nj = 6;

%https://www.universal-robots.com/how-tos-and-faqs/faq/ur-faq/parameters-for-calculations-of-kinematics-and-dynamics-45257/
%Different because we changed the orientation of the base X axis
% Nomminal Denavit-Hartenberg parameters and link distances
l = [0.352 0.07 0.360 0.380 0.065];
% DH: [a, alpha,    d, theta] 
dhr = [ l(2)  pi/2	 l(1)    0;
        l(3)  0      0       pi/2;
        0     pi/2   0   	 0;
        0    -pi/2   l(4)    0;
        0     pi/2   0       0;
        0     0      l(5)    0];

start_angle = [0, 0, 0, 0, 0, 0];
test_angle = [30 20 30 0 60 0];
plot = true;
  
flag = [0 0 0 0 0 0];
eedisp = zeros(nj, 3);

[Ar, An] = main(name, nj, dhr, start_angle, flag, eedisp, test_angle, plot);
Ar
An