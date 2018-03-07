% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Depth_Dose compute depth dose value according to the Depth Dose 
% Function graph into a global look up table
% Inputs: maxDepthFromSkin, d0(max raditation),
% depthFromSkinResolution(increment)
% Output: depthDoseLUT (global look up table)

function [depthDoseLUT] = Compute_Depth_Dose(maxDepthFromSkin, d0, depthFromSkinResolution)

    % Depth dose at each depthFromSkinResolution increment
    % Between 0 and d0
    for i = 0:depthFromSkinResolution:d0
        depthDose(1,i+1) = i;
            depthDose(2,i+1) = Compute_Linear_Function([0,0],[20,1],i);
    end
    
    % Between d0 and maxDepthFromSkin
    for j = d0:depthFromSkinResolution:maxDepthFromSkin
        depthDose(1,j+1) = j;
            depthDose(2,j+1) = Compute_Linear_Function([20,1],[120,0.5],j);
    end
    
    depthDoseLUT = depthDose';

end