function z = q1(t,h)

dh(1) = 10 + 4*sin(t) - 2*sqrt(h(1));

z = [dh(1)];