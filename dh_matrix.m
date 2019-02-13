function [ T ] = dh_matrix(a, alpha, d, theta )
% DH_MATRIX Computes the standard Denavit-Hartenberg relative coordinate frame
% matrix from the parameters.
%
% function [ T ] = DH_MATRIX(a, alpha, d, theta )
%
% a: length of the common normal (also known as 'r')
% alpha: angle between the previous to the current z-axis around the common normal
% d: offset from the previous z-axis to the common normal
% theta: angle between the previous to the current x-axis around the previous z-axis
%
% T: Relative coordinate frame transformation.
%
% [1] J. Denavit and R. Hartenberg, “A kinematic notation for lower-pair 
%   mechanisms based on matrices,” Trans. ASME E, J. Appl. Mech., vol. 22, 
%   pp. 215–221, 1955.
%

T = [cos(theta), -sin(theta) * cos(alpha),  sin(theta) * sin(alpha), a*cos(theta);
    sin(theta),   cos(theta) * cos(alpha), -cos(theta) * sin(alpha), a*sin(theta);
    0.0,          sin(alpha),               cos(alpha),              d;
    0.0,          0.0,                      0.0,                     1];

end