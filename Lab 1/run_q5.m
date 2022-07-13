clear all;
close all;

t0 = 0;
tf = 10;
tspan = t0:0.1:tf;

[t,y] = ode45('q5', tspan, [1,0]);

[t y(:,1) y(:,2)]

plot(t,y(:,1),t,y(:,2),'--r')