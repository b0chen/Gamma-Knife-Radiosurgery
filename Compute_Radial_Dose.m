% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Radial_Dose computes radial dose value according to the Radial 
% Dose Function graph
% Input: maxRadialDistance, beamRadius, radialDistanceResolution
% Output: radialDoseLUT

function [radialDoseLUT] = Compute_Radial_Dose(maxRadialDistance,  beamRadius,...
    radialDistanceResolution)

for i = -maxRadialDistance:radialDistanceResolution:maxRadialDistance
    radialDose(1,i + maxRadialDistance + 1) = i;
    if (i >= -(beamRadius/2) & i <= (beamRadius/2))
        radialDose(2, i + maxRadialDistance + 1) = 1;      
    else if (i > -maxRadialDistance & i < beamRadius/2)
        radialDose(2, i + maxRadialDistance + 1) = Compute_Linear_Function(...
            [-22.5,0],[-(beamRadius/2), 1],i); 
    else if ( i < maxRadialDistance & i > beamRadius/2)
        radialDose(2, i + maxRadialDistance + 1) = Compute_Linear_Function(...
            [beamRadius/2,1],[22.5,0],i); 
    else
        radialDose(2, i + maxRadialDistance + 1) = 0;       
    end
    end
    end
end
   
radialDoseLUT = radialDose';
end