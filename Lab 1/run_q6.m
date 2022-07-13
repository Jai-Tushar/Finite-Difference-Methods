clear all;
close all;

y1 = -1;
y2 = 1;

[t,y] = ode45('q6',[0:0.2:100],[-1,1]);

plot(t,y(:,1))