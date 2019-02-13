function [ o2, x2 ] = pc_identical( n1, n2, c1, c2, x1, tol )
%PC_IDENTICAL Determines the intersection point and the common normal
%between two identical lines in 3D space. Since there is no unique solution,
%a convention is set so that a new line normal to lines 1 and 2 is drawn,
%which passes through c1. Then, the intersection point and common normal is
%determined as one would do for an intersection case between the new line
%and line 2.
%
% function [ o2, x2 ] = PC_PARALLEL( n1, n2, c1, c2, x1, tol )
%
% n1: 3x1 direction vector of line 1
% n2: 3x1 direction vector of line 2
% c1: 3x1 point contained in line 1
% c2: 3x1 point contained in line 2
% x1: 3x1 common normal of previous relative coordinate frame
% tol: calculations tolerance
%
% o2: 3x1 position vector (closest point in line 2 from line 1)
% x2: 3x1 common normal
%

o2 = c1;
x2 = x1;

end

