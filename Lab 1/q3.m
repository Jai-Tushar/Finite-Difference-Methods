function z = q3(t,y)

dy(1) = y(2);
dy(2) = sin(t) - 5*y(2) - 4*y(1);

z = [dy(1);dy(2)];