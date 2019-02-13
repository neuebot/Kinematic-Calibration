function h_circle=circle_3D(r, M, n, color)


%==============================
%----------circle_3D-----------
%==============================
%Version 1.0 (October 2013)
%Version 1.1 (December 2014)
%    * plot3 used instead of scatter3, thanks to Matlab user "Atipong"
%Andreas Schmid
% 
%
%The function  draws a circle into axis with the handle hAxis
%Input:
%
% r     =   Radius of the circle
% M     =   Midpoint of the circle
% N     =   Vector perpendicular to the circle
%
%example:
%>> h_circle=circle_3D(3, [0 0 0], [1 1 1]);
%plots a circle of radius 3, perpendicular to the vector (1, 1, 1)
%around the origin of the coordinates system%
%

%% Prepare input parameters
if size(n,2)>size(n,1)
    n=n';
end

if size(M,2)>size(M,1)
    M=M';
end

%% Define unit vectors u and v
% u and v define a new coordinate system in a plane perpendicular to n
a=[1;0;0];
b=[0;1;0];

if isempty(find(cross(a,n), 1))==1
    a=[0;0;1];
elseif isempty(find(cross(b,n), 1))==1
    b=[0;0;1];
end
alpha=dot(n,a)/dot(n,n);
u=a-alpha*n;
beta=dot(n,b)/dot(n,n);
gamma=dot(u,b)/dot(u,u);
v=cross(u,n);%b-beta*n-gamma*u;

u=u/sqrt(sum(u.*u));
v=v/sqrt(sum(v.*v));

%% Plot the circle
hAxis=gca;
% hold on
% axis equal

i=0;
x=zeros(361,1);
y=zeros(361,1);
z=zeros(361,1);
for phi=0:pi()/180:2*pi()
    i=i+1;
    x(i)=M(1,1)+r*cos(phi)*u(1,1)+r*sin(phi)*v(1,1);
    y(i)=M(2,1)+r*cos(phi)*u(2,1)+r*sin(phi)*v(2,1);
    z(i)=M(3,1)+r*cos(phi)*u(3,1)+r*sin(phi)*v(3,1);
end
h_circle=plot3(x, y, z, 'Parent', hAxis, 'Color', color);

