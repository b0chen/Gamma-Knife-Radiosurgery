% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Beam_Direction_Vector_Test tests Compute_Beam_Direction_Vector

beamLongitude = [0,90,180,270];
beamLatitude = [0,90];

beamDirectionVector = zeros(size(beamLongitude,2),size(beamLatitude,2)*3);    

for i = 1:size(beamLongitude,2)
    beamDirectionVector(i,1:3) = Compute_Beam_Direction_Vector(beamLongitude(i),beamLatitude(1));
    beamDirectionVector(i,4:6) = Compute_Beam_Direction_Vector(beamLongitude(i),beamLatitude(2));
end

disp(beamDirectionVector);