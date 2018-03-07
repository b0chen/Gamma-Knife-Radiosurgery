% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Beam_Safety_Table compute beam safety for each beam and write the
% result into a global table

% Input: beamRadius, isocenterPoint, OAR
% Output: beamSafetyTable

helmet = [10, 15];
OAR = [15, 0, 30, 45];
increment = helmet(1);
PTV = [15, 30, 0, 15];
isocenter = [PTV(2), PTV(3), PTV(4)];

LongitudeIncrement = floor(360./increment - 1);
LatitudeIncrement = floor(90./increment);

LongitudeAngles = zeros(LongitudeIncrement,1);
LatitudeAngles = zeros(LatitudeIncrement,1);

for i = 1:LongitudeIncrement+1
    LongitudeAngles(i) = (i-1)*increment;
end

for j = 1:LatitudeIncrement+1
    LatitudeAngles(j) = (j-1)*increment;
end

global beamSafetyTable

beamSafetyTable = zeros(length(LongitudeAngles'),length(LatitudeAngles'));
for i = 1:length(LongitudeAngles')
    for j = 1:length(LatitudeAngles')
        beamSafetyTable(i,j) = Compute_Beam_Safety(helmet,LongitudeAngles(i),LatitudeAngles(j),isocenter,OAR);
    end
end

disp(beamSafetyTable);
