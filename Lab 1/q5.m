function z = q5(t,y)

dy(1) = y(2);
dy(2) = -y(1) - 0.897*(y(1)^2 - 1)*y(2);

z = [dy(1);dy(2)];