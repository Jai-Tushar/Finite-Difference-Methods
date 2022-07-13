%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%               Method of lines                       %%%%
%%%         u_t = u_{xx} + f(x, t), 0 < x < 1, t > 0     %%%%
%%%              u(x, 0) = sin(pi*x),                    %%%%  
%%%              u(0, t) = u(1, t) = 0,                  %%%%
%%%  Exact soln: u(x, t) = exp(-t)*sin(pi*x)             %%%%
%%%        Here f(x, t) = exp(-t)*sin(pi*x)*(pi^2 - 1);  %%%%
%%%           Course: MATH F422, Dr. P. Dhanumjaya       %%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

global N h x

%format long;

x0 = 0;
xN = 1;
N = 50;
h = (xN-x0)/N;

for j = 1:N-1
    x(j) = j*h;
    u0(j) = sin(pi*x(j));
end

t0 = 0;
tf = 1;

tspan = t0:0.1:tf;

[p q] = size(tspan);

[t y] = ode23s('molrhs',tspan,u0);

asol = y(q,:);
for j = 1:N-1
    exact(j) = exp(-tf)*sin(pi*x(j));
end


[asol' exact']

plot(x,asol,'o',x,exact)