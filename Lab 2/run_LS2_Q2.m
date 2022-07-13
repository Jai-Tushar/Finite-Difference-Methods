clear all;
close all;
format long;

global N h x

xI = 0;
xF = 1;
N  = 50;
h  = (xF - xI)/N;

tI = 0;
tF = 1;
tspan = tI:0.1:tF;

for j = 1 : N+1
    x(j)  = (j-1)*h;
    u0(j) = x(j)*(1 - x(j));
end

[t y] = ode45('LS2_Q2', tspan, u0);

[p q] = size(tspan);

asol = y(q,:);

for j = 1 : N+1
    uexact(j) = exp(-tF)*x(j)*(1 - x(j));
end

[asol' uexact']

plot(x,asol,'o',x,uexact)