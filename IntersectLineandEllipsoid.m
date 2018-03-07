%Bo Chen
%10190141
%14bc57

%CISC 330
%September 29, 2017 (suggested corrections made from assignment 1 feedback)
%Assignment 1

% 1) IntersectLineandEllipsoid 
% Input: [point1x, point1y, point1z] [point2x, point2y, point2z] a,b,c
% Output: Number of intersection points [point1x, point1y, point1z] [point2x, point2y, point2z]

function [intpoint1, intpoint2 ] = IntersectLineandEllipsoid(pa, pb, x, y, z)

%point 1 - point 2
v = pb - pa;

%set up for quadratic equation (see written calculations)
a = v(1).^2/x.^2 + v(2).^2/y.^2 + v(3).^2/z.^2;
b = 2.*v(1).*pa(1)/x.^2 + 2.*v(2).*pa(2)/y.^2 + 2.*v(3).*pa(3)/z.^2;
c = pa(1).^2/x.^2 + pa(2).^2/y.^2 + pa(3).^2/z.^2 - 1;

p = [a b c];

%solution 1 and solution 2 from quadratic formula
r = roots(p);
 
%sub solution 1 and 2 back into line equation to find points x,y,z
intpoint1 = [pa(1) + r(1).*v(1),pa(2) + r(1).*v(2), pa(3) + r(1).*v(3)];
intpoint2 = [pa(1) + r(2).*v(1),pa(2) + r(2).*v(2), pa(3) + r(2).*v(3)];
