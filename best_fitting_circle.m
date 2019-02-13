function [ c, n, h ] = best_fitting_circle( M, plot, color )
%BEST_FITTING_CIRCLE Determines the center and plane of rotation of the
%best fitting circle to the received set of points.
%
% function [ c, n ] = BEST_FITTING_CIRCLE( M, plot )
%   
% M: Nx3 array of points saved per trajectory
% plot: boolean to decide whether to plot the resulting points and best
% fitting circles in 3D
%
% c: 3x1 position vector with the center of the best fitting 3D circle
% n: 3x1 vector normal to the plane of the best fitting 3D circle
%
% The direction of n matches the 'right hand rule' rotation of the points
tol = 1e-6;

npts = length(M);

% Find centroid of points
cntrd = [sum(M(:,1)), sum(M(:,2)), sum(M(:,3))] / npts;

% Create centered cloud of points
N = (M - repmat(cntrd, npts, 1));

% Singular value decomposition of matrix N
[U, S, V] = svd(N);

% Vectors to the first and last elements used to determine the direction of
% the arc.
v1 = M(1,:)-cntrd;
v2 = M(end,:)-cntrd;
ori = unit(cross(v2,v1));

% Adjust the common normal direction
uV3 = unit(V(:,3));
if dot(ori, uV3) < 0 
    n = -uV3;
else
    n = uV3;
end

%Project points into fitting plane
%If the plane vector is already aligned with the z-axis base vector, there
%is no need to rotate all the points
if(1 - abs(dot(n, [0 0 1])) < tol)
    P_rot = N;
else
    P_rot = rodrigues_rotation(N, n, [0 0 1]');
end

%Circle fitting in 2D
[xc1, yc1, r1] = fit_circle_2d(P_rot(:,1), P_rot(:,2));

%Transform circle back to 3D
if(1 - abs(dot(n, [0 0 1])) < tol)
    c = [xc1, yc1, 0]' + cntrd';
else
    c = rodrigues_rotation([xc1, yc1, 0], [0,0,1]', n)' + cntrd';
end
    
if(plot)
    circle_3D(r1, c, n, color);
    h = plot3(M(:,1), M(:,2), M(:,3), 'LineWidth', 3, 'Color', color);
end

end

