% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Point_Dose computes the dose in a given point of interest from 
% all beams.
% Input: Head, Helmet, OAR, isocenterPoint, pointOfInterest
% Output: doseValue

function[doseValue] = Compute_Point_Dose(Head, Helmet, OAR, isocenterPoint, pointOfInterest)

    global SafetyTable;
    tableSize = size(SafetyTable);
    doseValue = 0;
    
    for i = 2:tableSize(1)
        for j = 2:tableSize(2)
            if (SafetyTable(i,j) == 1)
                % include beam 
                doseValue = doseValue + Compute_Point_Dose_from_Beam(Head,Helmet(2),SafetyTable(i,1),SafetyTable(1,j),isocenterPoint,pointOfInterest);                
            end
        end
    end
end