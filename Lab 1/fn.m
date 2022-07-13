function [dydt] = fn(t,y)

    
%     y1 = y(1);
%     y2 = y(2);
%     y3 = y(3);
%     A = 10*(y(2)-y(1));  
%     B = (29-y(3))*y(1)-y(2);
%     C = y(1)*y(2)-8/3*y(3);
    R = 11000; L = 0.003; C = 1e-10;
    A = y(2);
    B = -(1/L*C)*y(1) - (R/L)*y(2);
%     dydt = [A;B;C];
    dydt = [A;B];

end