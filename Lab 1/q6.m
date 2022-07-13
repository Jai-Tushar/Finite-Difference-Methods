function z = q6(t,y)

dy(1) = y(2);
dy(2) = 0.3*cos(t) - 0.15*y(2) - y(1)^3;

z = [dy(1);dy(2)];