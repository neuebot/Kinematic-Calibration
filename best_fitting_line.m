function [ c, n, h ] = best_fitting_line( T, eedisp, plot, color )
%BEST_FITTING_LINE Determines the vector and a point aligned with the 
% received points.
%
% function [ c, n, h ] = BEST_FITTING_LINE( T, eedisp, plot, color )
%   
% T: Nx3 array of points saved per trajectory
% eedisp: 3x1 distance from recorded point to the flange relative to the
% base reference frame. This distance needs to be accounted for in 
% prismatic joints.
%   
% plot: draws the plot with the points and the best fitting line in 3D
% color: color of the plot 
%
% c: 3x1 position of a point contained in the 3D line
% n: 3x1 vector that best fits the 3D line
% h: plot handle
%
% The direction of n matches the 'right hand rule' rotation of the points

% Account for the displacement of the recorded point relative to the flange
%tip.
T=bsxfun(@minus,T,eedisp);

% Find the centroid
c=mean(T);

% Obtain the centered point array
M=bsxfun(@minus,T,c);
[~,~,V]=svd(M,0);
 
ep = c + V(:,1)';

% Best fitting array to the line
n = unit(ep - c);

if(plot)
    t = linspace(-0.5,0.5,1000)';
    r = bsxfun(@plus, c, t*V(:,1)');
    
    line(r(:,1), r(:,2), r(:,3), 'Color', color);
    h = plot3(T(:,1), T(:,2), T(:,3), 'LineWidth', 3, 'Color', color);
end

end

