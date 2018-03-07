% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Radial_Distance computes the radial distance between the center 
% line of a beam and an arbitrary point in space
% Input: point, line [point_on_line, line_direction_vector]
% Output: distance

function [distance] = Compute_Radial_Distance(Point, Line)

    pointOnLine = [Line(1), Line(2), Line(3)];
    lineDirectionVector = [Line(4), Line(5), Line(6)];

    % Direction vector (line perpendicular to the point)  
    DirectionVector = cross((Point - pointOnLine),lineDirectionVector);
    
    distance = norm(DirectionVector/norm(lineDirectionVector));
end