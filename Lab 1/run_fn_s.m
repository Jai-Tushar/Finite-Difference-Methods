y0 = 0;
y1 = 0;

t0 = 0;
tf = 1;
n  = 10;
h  = (tf - t0)/n;
tspan = t0:h:tf;

[T, Y] = ode45('fn_s', tspan, [y0,y1]); 


