clear all;
close all;

h0 = 1;

t0 = 0;
tf = 30;
tspan = t0:0.2:tf;

[T, Y] = ode45('q1', tspan, h0); 

[T Y(:,1)]

