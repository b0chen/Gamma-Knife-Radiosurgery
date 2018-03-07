% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Beam_Safety computes if a pencil beam is safe. The beam is unsafe
% if the beam intersects with the OAR, and unsafe if it does intersect.

% Input: beamRadius, beamLongitude, beamLatitude, isocenterPoint, OAR
% Output: 0 = unsafe (intersection) 1 = otherwise


function [beamSafety] = Compute_Beam_Safety(beamRadius, beamLongitude, beamLatitude, isocenterPoint, OAR)
    
    OARpos = [OAR(2), OAR(3), OAR(4)];
    EntryVector = Compute_Beam_Direction_Vector(beamLongitude,beamLatitude);
    dist = Compute_Radial_Distance(OARpos, [isocenterPoint,EntryVector]);
     
    %if distance <= beam radius + OAR radius it is unsafe
    if (dist <= beamRadius(2) + OAR(1))
        beamSafety = 0;
    else 
        beamSafety = 1;
    end

end