function [ xc, yc, r ] = fit_circle_2d( x, y )
%FIT_CIRCLE_2D Determines the center coordinate and radius of the circle
%that best fits a set of 2D points.
%
% function [ xc, yc, r ] = FIT_CIRCLE_2D( x, y )
%
% x: Nx1 set of x coordinates
% y: Nx1 set of y coordinates
%
% xc: x coordinate of center of best fitting circle
% yc: y coordinate of center of best fitting circle
% r: radius of best fitting circle
%

A = [x, y, ones(size(x))];
b = x.^2 + y.^2;

c = A\b;

xc = c(1)/2;
yc = c(2)/2;
r = sqrt(c(3) + xc^2 + yc^2);

end

