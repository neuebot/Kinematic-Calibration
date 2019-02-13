function [ angle ] = pc_angle( n1, n2, cn )
%PC_ANGLE Determines the angle between two vectors around a commmon normal
%vector.
%
% function [ angle ] = PC_ANGLE( e1, e2, en )
%
% n1: 3x1 starting vector
% n2: 3x1 end vector
% cn: 3x1 common normal, around which the angle is determined
%

angle = atan2(dot(cross(n1, n2),cn), dot(n1, n2));

end

