% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Beam_Direction_Vector computes the unit direction vector for the 
% pencil beam?s centerline from beam longitude and beam latitude, in 
% Cartesian coordinates.
% Input: beamLongitude, beamLatitude
% Output: beamDirectionVector

function [beamDirectionVector] = Compute_Beam_Direction_Vector(beamLongitude, beamLatitude)

    % Points on a sphere (beamLongitude (azimuth) and beamLatitude (elevation))
    % * pi/180 to convert to radians
    x = cos(beamLatitude * pi/180) .* cos(beamLongitude * pi/180);
    y = cos(beamLatitude * pi/180) .* sin(beamLongitude * pi/180);
    z = sin(beamLatitude * pi/180); 
    
    % Isocenter - source
    % Normalize
    beamDirectionVector = ([0,0,0]-[x,y,z])/norm([0,0,0]-[x,y,z]);

end