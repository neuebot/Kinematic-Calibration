function [ o2, x2 ] = pc_intersect( n1, n2, c1, c2, x1, tol )
%PC_INTERSECT Determines the intersection point and the common normal
%between two intersecting lines in 3D space.
%
% function [ o2, x2 ] = PC_INTERSECT( n1, n2, c1, c2, x1, tol )
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

p = zeros(3,1);

if(abs(dot(n1, k2) - dot(n2, k1)) > tol) 
    if(abs(dot(n2, k1)) > tol)
        p = cross(k1, k2) / dot(n2, k1);
    else
        og = unit(cross(n1, n2));

        k1g = k1 + cross(og, n1);
        k2g = k2 + cross(og, n2);

        pg = cross(k1g, k2g) / dot(n2, k1g); 
        p = pg - og;
    end
else
    if(abs(dot(n1, k2)) > tol)
        p = cross(k2, k1) / dot(n1, k2);
    else
        og = unit(cross(n1, n2));

        k1g = k1 + cross(og, n1);
        k2g = k2 + cross(og, n2);

        pg = cross(k2g, k1g) / dot(n1, k2g); 
        p = pg - og;
    end
end

%Intersection point
o2 = p;

% Determination of the common normal.
% Since we have two possible solitions, two rules were established to
% obtain consistent results.
% 1. If the obtained common normal has the same or the inverted direction 
% of the previous common normal, it defaults to the direction of the 
% previous. 
x2 = unit(cross(n1,n2));
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

