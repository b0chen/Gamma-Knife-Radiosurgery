% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Draw_3D_Scene Draw the 3D scene with Head, PTV, OAR, isocenter, dose_box,
% and the coordinate axes 
% Input: Head, PTV, OAR, isocenter, doseBox

function [] = Draw_3D_Scene(Head, PTV, OAR, isocenter, doseBox)
    % Set up
    figure;
    hold on;
    title('Gamma Knife Radiosurgery')
    axis equal;
    xlabel('X Axis');
    ylabel('Y Axis');
    zlabel('Z Axis');

    % Plot Head
    [x,y,z] = ellipsoid(Head(4), Head(5), Head(6), Head(1), Head(2), Head(3));
    set(surf(x,y,z), 'FaceAlpha', 0.05);
    text(Head(4),Head(5),(Head(6)+Head(3)*1.05),'Head', 'FontSize', 13)
    
    % Plot PVT (red)
    [x,y,z] = ellipsoid(PTV(2), PTV(3), PTV(4), PTV(1), PTV(1), PTV(1));
    set(surf(x,y,z), 'FaceAlpha', 0.05, 'FaceColor', [1 0 0]);
    text(PTV(2), PTV(3), (PTV(4)+PTV(1)*1.2),'PVT', 'FontSize', 13)
    
    % Plot OAR (green)
    [x,y,z] = ellipsoid(OAR(2),OAR(3),OAR(4), OAR(1), OAR(1), OAR(1));
    set(surf(x,y,z), 'FaceAlpha', 0.05, 'FaceColor', [0 1 0]);
    text(OAR(2), OAR(3), (OAR(4)+OAR(1)*1.2),'OAR', 'FontSize', 13)
   
    % Plot isocenter
    plot3(isocenter(1),isocenter(2),isocenter(3), '*');
    text(isocenter(1)+3, isocenter(2)+3, isocenter(3)+3,'isocenter', 'FontSize', 13)
    
    % Plot doseBox (lines between the 8 points) (red)
    text(doseBox(1), doseBox(2), doseBox(6),'doseBox', 'FontSize', 13)
    v = [[doseBox(1), doseBox(2), doseBox(3)]; [doseBox(1), doseBox(5), doseBox(3)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(1), doseBox(2), doseBox(3)]; [doseBox(1), doseBox(2), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(1), doseBox(2), doseBox(3)]; [doseBox(4), doseBox(2), doseBox(3)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(1), doseBox(5), doseBox(3)]; [doseBox(1), doseBox(5), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(1), doseBox(5), doseBox(6)]; [doseBox(1), doseBox(2), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(1), doseBox(5), doseBox(6)]; [doseBox(4), doseBox(5), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(1), doseBox(5), doseBox(3)]; [doseBox(4), doseBox(5), doseBox(3)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(4), doseBox(5), doseBox(3)]; [doseBox(4), doseBox(2), doseBox(3)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(4), doseBox(2), doseBox(3)]; [doseBox(4), doseBox(2), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(4), doseBox(5), doseBox(3)]; [doseBox(4), doseBox(5), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(1), doseBox(2), doseBox(6)]; [doseBox(4), doseBox(2), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
    v = [[doseBox(4), doseBox(5), doseBox(6)]; [doseBox(4), doseBox(2), doseBox(6)]];
    plot3(v(:,1), v(:,2), v(:,3), 'r');
end