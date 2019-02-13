function [ o2, x2 ] = pc_skewed( n1, n2, c1, c2, x1, tol )
%PC_SKEWED Determines the closest points and the common normal between two
%skewed lines.
%
% function [ o2, x2 ] = PC_SKEWED( n1, n2, c1, c2, x1, tol )
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

k1 = cross(c1, n1);
k2 = cross(c2, n2);

% Common normal to n1 and n2
n = cross(n1, n2);

% Angle between lines
b = atan2(norm(cross(n1, n2)), dot(n1, n2));

% Closest points between lines, in line 1 and 2 respectively
% p1 = ((dot(k2, n) - cos(b)*dot(k1,n)) / sin(b))*n1 + cross(n1, k1);
p2 = ((-dot(k1, n) + cos(b)*dot(k2,n)) / sin(b))*n2 + cross(n2, k2);

% Returned closest point
o2 = p2;

% Determination of the common normal.
% Since we have two possible solitions, two rules were established to
% obtain consistent results.
% 1. If the obtained common normal has the same or the inverted direction 
% of the previous common normal, it defaults to the direction of the 
% previous. 
x2 = unit(n);
if(abs(dot(x1,x2)) > 1-tol)
    x2 = x1;
else
    % 2. When the common normal does not align with the previous, or there
    % is no previous, by definition and to keep a certain convention,
    % whenever the common normal aligns with the y-axis, we force it to be
    % positive.
    if(abs(dot(cross(n1,n2),[0 1 0])) > 0.5)
        x2 = sign(dot(cross(n1,n2),[0 1 0])) * x2;
    end
end

