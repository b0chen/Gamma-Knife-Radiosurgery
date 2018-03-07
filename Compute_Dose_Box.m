% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Dose_Box creates a box around the PTV and OAR as tight as
% possible without margin.
% Input: PTV, OAR
% Output: doseBox

function [doseBox] = Compute_Dose_Box(PTV, OAR)

    % finds each x, y, z value + an - the radius
    x = [PTV(2) - PTV(1), PTV(2) + PTV(1), OAR(2) - OAR(1), OAR(2) + OAR(1)];
    y = [PTV(3) - PTV(1), PTV(3) + PTV(1), OAR(3) - OAR(1), OAR(3) + OAR(1)];
    z = [PTV(4) - PTV(1), PTV(4) + PTV(1), OAR(4) - OAR(1), OAR(4) + OAR(1)];

    %uses min() and max() to find the [lower left, upper right] of the dose box
    doseBox = [min(x),min(y),min(z),max(x),max(y),max(z)];

end