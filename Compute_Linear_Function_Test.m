% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Linear_Function_Test tests Compute_Linear_Function using points 
%  P1(1,1), P2(5,5), x = {0, 1, ? 6 };

P1 = [1,1];
P2 = [5,5];
x = [1,2,3,4,5,6];

for i = 1:6
    y = Compute_Linear_Function(P1,P2,x(i));
    disp (y);
end
