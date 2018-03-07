%Bo Chen
%10190141
%14bc57

%CISC 330
%September 29, 2017 
%Assignment 1

% 1) Distance-of-Line-and-Point
% input:([linePoint1x, linePoint1y, linePoint1z], 
% [linePoint2x, linePoint2y, linePoint2z], [PointX, PointY, PointZ])
% Output: Distance

function [Distance] = DistanceofLineandPoint(linePoint1, linePoint2, Point)

a = linePoint2 - linePoint1;
b = Point - linePoint2;

%Distance = sqrt(sum(cross(a,b,2).^2,2)) ./ sqrt(sum(a.^2,2))
Distance = norm(cross(a,b)) / norm(a);

end

