function [ F ] = pc_revolute( n1, n2, c1, c2, x1, o1 )
%PC_REVOLUTE Computes the relative coordinate frame transformation based on
%two lines. Each line is specified by a direction vector (n) and a
%contained point (c).
%
%Dual Vector Geometry is used to identify the relationship between lines:
%parallel, intersect or skewed, and to compose the relative coordinate
%frame, accordingly.
%
% function [ F ] = PC_REVOLUTE( n1, n2, c1, c2, x1 ) 
%
% n1: 3x1 direction vector of line 1
% n2: 3x1 direction vector of line 2
% c1: 3x1 point contained in line 1
% c2: 3x1 point contained in line 2
% x1: 3x1 common normal of previous relative coordinate frame
%
% F: 4x4 matrix with the relative coordinate frame transformation
%

%Calculations tolerance
tol = 1e-3;

k1 = cross(c1, n1);
k2 = cross(c2, n2);

%Real part of line product 
rp = dot(n1, n2);

%Dual part of line product
dp = dot(n1, k2) + dot(k1, n2);

%If the dual part == 0 
if(abs(dp) < tol)
    %If the real part == 1
    if(1 - abs(rp) < tol)
        % Angle between lines
        b = atan2(norm(cross(n1, n2)), dot(n1, n2));
        c12 = unit(c2 - c1);
        if(1 - abs(dot(c12, n1)) < tol )
            nl1 = x1;
        else 
            nl1 = unit(cross(c12, n1));
        end
        % Vector normal that intersects both lines
        nll1 = unit(cross(n1, nl1));
        d = dot((c2 - c1), nll1);

        % Closest points between lines, in line 1 and 2 respectively
        cdp = d * cos(b);
        
        if(abs(cdp) < tol)
            %IDENTICAL
            o2 = o1;
            x2 = x1;
        else
            %PARALLEL
            [o2, ~] = pc_intersect(nll1, n2, c1, c2, x1, tol);
            x2 = nll1;
        end
        
    else
        %INTERSECT
        [o2, x2] = pc_intersect(n1, n2, c1, c2, x1, tol);
    end
else
    %SKEWED
    [o2, x2] = pc_skewed(n1, n2, c1, c2, x1, tol);
end

%Relative coordinate frame
F = [x2, cross(n2, x2), n2, o2; 0 0 0 1];

end

