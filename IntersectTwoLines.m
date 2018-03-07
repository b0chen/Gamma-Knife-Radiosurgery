%Bo Chen
%10190141
%14bc57

%CISC 330
%September 29, 2017 
%Assignment 1

% 1) Intersect-Two-Lines
% Input:([line1point1x, line1point1y, line1point1z], [line1point2x, line1point2y, line1point2z],
% [line2point1x, line2point1y, line2point1z], [line2point2x, line2point2y, line2point2z])
% Ouput: Intersection point [x,y,z], avg distance, std

%This code is a modified version of https://www.mathworks.com/matlabcentral/fileexchange/37192-intersection-point-of-lines-in-3d-space
function [P_intersect, emetric] = IntersectTwoLines(lineAPoint1, lineAPoint2, lineBPoint1, lineBPoint2)
    
% PA : Nx3-matrix containing starting point of N lines
PA = [lineAPoint1;lineBPoint1];

% PB : Nx3-matrix containing end point of N lines
PB = [lineAPoint2;lineBPoint2];
Si = PB - PA; %N lines described as vectors

ni = Si ./ (sqrt(sum(Si.^2,2))*ones(1,3)); %Normalize vectors

nx = ni(:,1);
ny = ni(:,2);
nz = ni(:,3);

SXX = sum(nx.^2-1);
SYY = sum(ny.^2-1);
SZZ = sum(nz.^2-1);
SXY = sum(nx.*ny);
SXZ = sum(nx.*nz);
SYZ = sum(ny.*nz);

S = [SXX SXY SXZ;SXY SYY SYZ;SXZ SYZ SZZ];

CX  = sum(PA(:,1).*(nx.^2-1) + PA(:,2).*(nx.*ny)  + PA(:,3).*(nx.*nz));
CY  = sum(PA(:,1).*(nx.*ny)  + PA(:,2).*(ny.^2-1) + PA(:,3).*(ny.*nz));
CZ  = sum(PA(:,1).*(nx.*nz)  + PA(:,2).*(ny.*nz)  + PA(:,3).*(nz.^2-1));
C   = [CX;CY;CZ];

% P_Intersect : Best intersection point of the N lines, in least squares sense.
P_intersect = (S\C)';

% Distances from intersection point to the input lines and error metric(STD) (output)
distances = (DistanceofLineandPoint(lineAPoint1, lineAPoint2, P_intersect) + DistanceofLineandPoint(lineBPoint1, lineBPoint2, P_intersect))/2;
emetric = std(distances);

end

