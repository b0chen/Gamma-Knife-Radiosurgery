% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Skin_Entry_Point compute the skin entry point of a pencil beam
% Determines which intersection of the line (created from isocenterPoint 
% and the beamLongitude, beamLatitude) and the head is closer to the source
% as the skinEntryPoint.

% Input: Head, beamLongitude, beamLatitude, isocenterPoint
% Output: skinEntryPoint

function [skinEntryPoint] = Compute_Skin_Entry_Point(Head, beamLongitude, beamLatitude, isocenterPoint)
    
    directionVector = Compute_Beam_Direction_Vector(beamLongitude,beamLatitude);
    Point = isocenterPoint - directionVector;

    % IntersectLineandEllipsoid from Assignment 1 
    % (suggested corrections made from Assignment 1 feedback)
    [intpoint1, intpoint2] = IntersectLineandEllipsoid(Point, isocenterPoint, Head(1), Head(2), Head(3));
    
    if (intpoint1(3) < intpoint2(3))
        skinEntryPoint = intpoint2;
        return;
    end
    if (intpoint1(3) > intpoint2(3))
        skinEntryPoint = intpoint1;
        return;
    end  
    if (isocenterPoint(1) > isocenterPoint(2)) && (intpoint1(1) < intpoint2(1))
        skinEntryPoint = intpoint2;
        return;
    end
    if (isocenterPoint(1) > isocenterPoint(2)) && (intpoint1(1) > intpoint2(1))
        skinEntryPoint = intpoint1;
        return;
    end            
    if (isocenterPoint(1) < isocenterPoint(2)) && (intpoint1(2) < intpoint2(2))
        skinEntryPoint = intpoint2;
        return;
    end
    if (isocenterPoint(1) < isocenterPoint(2)) && (intpoint1(2) > intpoint2(2))
        skinEntryPoint = intpoint1;
        return;
    end
    skinEntryPoint = intpoint1;
    
end