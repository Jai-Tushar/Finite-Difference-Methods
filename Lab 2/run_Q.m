clear all;
close all;

format long;

global N h x

x0 = 0;
xN = 1;
N  = 50;
h  = (xN - x0)/N;

t0 = 0;
tf = 1;
tspan = t0:h:tf;

for j = 1:N+1
    x(j) = (j-1)*h;
    U0(j)= x(j)*(1-x(j));
end

[t y] = ode45('Q',tspan,U0);

[p q] = size(tspan);

aSol = y(q,:);

for j = 1:N+1
    eSol(j) = exp(-tf)*(x(j)*(1-x(j)));
end

[aSol' eSol']

error = max(abs(aSol - eSol))

plot(t,aSol,t,eSol,'ro')
