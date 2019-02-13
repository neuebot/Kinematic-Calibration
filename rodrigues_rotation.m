function [ P_rot ] = rodrigues_rotation( P, n0, n1 )
%RODRIGUES_ROTATION Rotates the received points based on the rotation from the
%start to the end vector.
%
% function [ P_rot ] = RODRIGUES_ROTATION( P, n0, n1 )
%
% P: Nx3 number of points to rotate
% n0: 3x1 starting vector
% n1: 3x1 ending vector
%

n0 = unit(n0);
n1 = unit(n1);

% Common normal to start and end vectors
k = cross(n0, n1);
k = unit(k);
% Angle between vectors
theta = atan2(norm(cross(n0, n1)), dot(n0, n1));

% Compute rotated points
P_rot = zeros(size(P));
for i=1:size(P,1)
   P_rot(i,:) = P(i,:)*cos(theta) + cross(k,P(i,:))*sin(theta) + k'*dot(k,P(i,:))*(1-cos(theta));
end

end

