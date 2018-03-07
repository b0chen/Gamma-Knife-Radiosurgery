% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Surface_ Dose computes the dose on the surfaces of the PTV and OAR. 
% Input:  Head, Helmet, isocenterPoint, PTV, OAR

function [dosePTV] = Compute_Surface_Dose(Head, Helmet, isocenterPoint, PTV, OAR)
    % Compute the dose radiation for the points on the spheres
    maxPTV = 0;
    maxOAR = 0;
    minPTV = 200;
    minOAR = 200;
    [x, y, z] = sphere(30);

    % Define PTV Sphere
    x1 = PTV(1) * x + PTV(2);
    y1 = PTV(1) * y + PTV(3);
    z1 = PTV(1) * z + PTV(4);
    
    % Define OAR Sphere
    x2 = OAR(1) * x + OAR(2);
    y2 = OAR(1) * y + OAR(3);
    z2 = OAR(1) * z + OAR(4);
    
    % Calculate radiation at surface points,
    % Find max, min, and positions
    for i = 1:length(x1')
        for j = 1:length(x1)
            doseOAR(i) = Compute_Point_Dose(Head,Helmet,OAR,isocenterPoint,...
                [x2(i,j), y2(i,j), z2(i,j)]);
            if (doseOAR(i) > maxOAR)
                maxOAR = doseOAR(i);
                maxOARpoint = [x2(i,j), y2(i,j), z2(i,j)];
            end
            if (doseOAR(i) < minOAR)
                minOAR = doseOAR(i);
                minOARpoint = [x2(i,j), y2(i,j), z2(i,j)];
            end
            dosePTV(i) = Compute_Point_Dose(Head,Helmet,OAR,isocenterPoint,...
                [x1(i,j), y1(i,j), z1(i,j)]);
            if (dosePTV(i) > maxPTV)
                maxPTV = dosePTV(i);
                maxPTVpoint = [x1(i,j), y1(i,j), z1(i,j)];
            end 
            if (dosePTV(i) < minPTV)
                minPTV = dosePTV(i);
                minPTVpoint = [x1(i,j), y1(i,j), z1(i,j)];
            end
        end
    end
    disp ('hottest on PTV')
    disp (maxPTV)
    disp ([maxPTVpoint(1), maxPTVpoint(2), maxPTVpoint(3)])

        disp ('coldest on PTV')
    disp (minPTV)
    disp ([minPTVpoint(1),minPTVpoint(2),minPTVpoint(3)])
    
        disp ('hottest on OAR')
    disp (maxOAR)
    disp ([maxOARpoint(1),maxOARpoint(2),maxOARpoint(3)])
    
        disp ('coldest on OAR')
    disp (minOAR)
    disp ([minOARpoint(1),minOARpoint(2),minOARpoint(3)])
end
