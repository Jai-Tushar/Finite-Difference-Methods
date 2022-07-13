function z = q4(t,y)

global g l

dy(1) = y(2);
dy(2) = (g/l)*sin(y(1));

z = [dy(1);dy(2)];