% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Point_Dose_from_Beam computes the dose at a point of interest from a beam.
% Input: Head, beamRadius, beamLongitude, beamLatitude, isocenterPoint, pointOfInterest
% Output: pointDoseValue

function[pointDoseValue] = Compute_Point_Dose_from_Beam(Head, beamRadius, beamLongitude, beamLatitude, isocenterPoint, pointOfInterest)
%(Head, beamRadius, beamLongitude, beamLatitude, isocenterPoint, pointOfInterest)
    global radialDoseLUT;
    global depthDoseLUT;
    sizeRad = length(radialDoseLUT');
    sizeDep = length(depthDoseLUT');
    
    radiationDose = 0; 
    depthDose = 0;

    beamDirectionVector = Compute_Beam_Direction_Vector(beamLongitude,beamLatitude);
    skinEntryPoint = Compute_Skin_Entry_Point(Head,beamLongitude,beamLatitude,isocenterPoint);
    distanceFromEntry = norm(sqrt((pointOfInterest - skinEntryPoint).^2));
    distance = round(Compute_Radial_Distance(pointOfInterest,[isocenterPoint,beamDirectionVector]));
    depth = round(norm(sqrt((distanceFromEntry - distance).^2)));
    
    % check to see if distance is outside radius
    if (distance > beamRadius * 1.5) 
        %if outside, radial distance = 0
        pointDoseValue = radiationDose * 0;
    else
        for i = 1:sizeDep
           % when value 1 == target, depthDose = value 2
           if (depthDoseLUT(i,1) == depth)
               radiationDose = depthDoseLUT(i,2);
           end
       end
       for j = 1:sizeRad
           % when value 1 == target, radiationDose = value 2
           if (radialDoseLUT(j,1) == distance)
               depthDose = radialDoseLUT(j,2);
           end
       end
    end
    % pointDoseValue is just the product 
    pointDoseValue = depthDose * radiationDose;   
end