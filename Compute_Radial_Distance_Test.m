% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Radial_Distance_Test tests Compute_Radial_Distance using known 
% ground truths

disp('Test 1');
point = [2,2,0];
pointOnLine = [3,4,0];
lineDirectionVector = [0,-1,0];
distance = Compute_Radial_Distance(point,[pointOnLine,lineDirectionVector])

disp('Test 2');
P2 = [5,0,0];
Pl2 = [0,0,0];
V2 = [4,3,0];
distance2 = Compute_Radial_Distance(point,[pointOnLine,lineDirectionVector])