% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Dose_Volume_Histogram computes the dose inside the dose_box with 
% a given dose voxel size and save the dose values in a 3D dose matrix.

% Input = Head, Helmet, PTV, OAR, isocenterPoint
% Output = OARdose,PTVdose


function[OARdose,PTVdose] = Compute_Dose_Volume_Histogram(Head, Helmet, PTV, OAR, isocenterPoint)

    global doseBox;
    oCount = 0;
    pCount = 0;

    % Check dose box for which points are in OAR & PTV
    %     voxelSize = 2;
    for i = doseBox(1):2:doseBox(4)
       for j = doseBox(2):2:doseBox(5)
            for k = doseBox(3):2:doseBox(6)
                %point within PTV
                if ((norm([i,j,k] - [PTV(2), PTV(3), PTV(4)])) <= PTV(1))
                pCount = pCount + 1;
                    PTVpoints(pCount,1:3) = [i,j,k];
                end
              %point within OAR
              if ((norm([i,j,k] - [OAR(2), OAR(3), OAR(4)])) <= OAR(1))
                   oCount = oCount + 1;
                   OARpoints(oCount,1:3) = [i,j,k];
               end
            end
        end
    end

    % Calculate the dosevalue for every point in each OARdose and PTVdose
    % matrices
    for i = 1:length(OARpoints')
        OARdose(i,1) = Compute_Point_Dose(Head, Helmet, OAR, isocenterPoint, OARpoints(i,:));
    end 

    for j = 1:length(PTVpoints')
        PTVdose(j,1) = Compute_Point_Dose(Head, Helmet, OAR, isocenterPoint, PTVpoints(j,:));
    end


end
