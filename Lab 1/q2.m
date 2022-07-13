function z = q2(t,u)

du(1) = (2 - u(2))*u(1);
du(2) = (u(1) - 1)*u(2);

z = [du(1); du(2)];