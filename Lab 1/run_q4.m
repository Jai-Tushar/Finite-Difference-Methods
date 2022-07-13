clear all; 
close all;
global g l
g = 9.8;
l = 0.5;
t0 = 0;
tf = 5;


tspan = t0:(1/8):tf;

[t,y] = ode45('q4', tspan, [pi/4,0]);

[t y(:,1)]

plot(t,y(:,1))