% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Linear_Function  computes the value of y=mx +b linear function
% Input: Point1 (P1) [x,y], Point2 (P2) [x,y], x
% Output: y value

function [y] = Compute_Linear_Function(P1, P2, x)
    
    %Exceptions
    % Points are the same & x value is not the same, y can not be found
    if (P1 == P2 & x ~= P1(1))
        y = NaN;
        disp('P1 and P2 are the same point, the y value can not be determined with the given x value');
        return;
    end
    % Points are the same & x value is the same, y = y  
    if (P1 == P2 & x == P1(1))
        y = P1(2);
        return;
    end
    % X values are the same (vertical line) y can not be found 
    if (P1(1) == P2(1))
         y = NaN;
         disp('P1 x and P2 x create a vertical line, the y value can not be determined');
         return;
    end
    % Y values are the same (horizontal line) y = y
    if (P1(2) == P2(2))
        y = P1(2);
        return;
    end
    
    % Line (P1, P2) intercepts Y axis
    b = IntersectTwoLines([P1(1), P1(2), 0], [P2(1), P2(2), 0], [0,0,0], [0,1,0]);
    b = b(2);
    
    % Slope
    m = (P2(2) - P1(2))./(P2(1) - P1(1));
    
    y = m.*x + b;
end