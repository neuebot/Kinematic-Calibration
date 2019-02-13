close all
clc

name = 'MICO';
nj = 6;

% Nominal Denavit-Hartenberg parameters and link distances
l = [0.2755 0.2900 0.1233 0.0741 0.0741 0.0];
e2 = 0.007;
sfrac = (sind(30)/sind(60));
d4b = l(3) + l(4)*sfrac;
d5b = sfrac*(l(4) + l(5));
d6b = l(6) + l(5)*sfrac;

% DH: [a, alpha,    d, theta] 
dhr = [ 0    -pi/2	 l(1)    0;
       l(2)   pi     0      -pi/2;
        0     pi/2  -e2   	-pi/2;
        0    -pi/3  -d4b     0;
        0    -pi/3  -d5b     0;
        0     0     -d6b     0];

start_angle = [0, 90, 90, 0, 0, 0];
test_angle = [-100, 30, -20, -57, 32, -15];
plot = true;
  
flag = [0 0 0 0 0 0];
eedisp = zeros(nj, 3);

[Ar, An] = main(name, nj, dhr, start_angle, flag, eedisp, test_angle, plot);
Ar
An