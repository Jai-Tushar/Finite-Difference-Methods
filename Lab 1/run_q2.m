clear all;
close all;

u0 = 3;
u1 = 2;

t0 = 0;
tf = 10;
n  = 100;
h  = (tf - t0)/n;
tspan = t0:h:tf;

[T, Y] = ode45('q2', tspan, [u0,u1]); 

[T Y(:,1) Y(:,2)]

figure('Name', 't vs u(t) & v(t)')
plot(T, Y(:,1),'-r')
hold on
plot(T, Y(:,2),'-.b')

figure('Name', 'u(t) vs v(t)')
plot(Y(:,1), Y(:,2))