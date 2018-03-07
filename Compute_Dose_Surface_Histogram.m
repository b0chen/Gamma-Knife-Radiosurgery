% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

%  Compute_ Dose_Surface_Histogram tests  Compute_Surface_Dose

    Helmet = [10, 15];
    Head = [80, 100, 80, 0, 0, 0];
    PTV = [15, 30, 0, 15];
    OAR = [15, 0, 30, 45];
    isocenterPoint = [0,0,0];

    [doseValues] = Compute_Surface_Dose(head, helmet, isocenter, PTV, OAR);
    
    figure;
    h = histogram(doseValues);
    xlabel('Radiation dose');
    ylabel('Amount of points');
    title('PTV Surface Radiation');

