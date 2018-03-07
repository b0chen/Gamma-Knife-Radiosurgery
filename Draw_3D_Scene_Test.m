% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Draw_3D_Scene_Test Draw tests Draw_3D_Scene

Head = [80, 100, 80, 0, 0, 0];
PTV = [15, 30, 0, 15];
OAR = [15, 0, 30, 45];
Isocenter = [PTV(2), PTV(3), PTV(4)];

Draw_3D_Scene(Head,PTV,OAR,Isocenter,doseBox)
