clear all;
close all;

format long;

global N h x

xI = 0; % xI = x1 and xF = x at N+1 point.
xF = 1;
N  = 50;
h  = (xF - xI)/N;

for j = 1 : N+1
    x(j)  = (j-1)*h; % x(1) = x1 and so on.
    u0(j) = x(j)^.2*sin(pi*x(j));
end    

t0 = 0;
tf = 1;

tspan = t0:0.1:tf;

[t y] = ode23s('pde1', tspan, u0);

[p q] = size(tspan);

approxsol = y(q,:);

for j = 1 : N+1
    uexact(j) = exp(-tf)*sin(pi*x(j))*(x(j))^2;
end

[approxsol' uexact']

plot(x,approxsol,'o',x,uexact)

