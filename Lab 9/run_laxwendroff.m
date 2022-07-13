clear all;
close all;

format long;

%domain
x0 = -5; xf = 5;
t0 = 0 ; tf = 1;

%parameters
N = 200;
h = (xf-x0)/N;
dt= 0.8*h;
mu= dt/h;
M = fix((tf-t0)/h);

%initialize vectors
x = zeros(N+1,1);
p = zeros(N+1,1);
q = zeros(N+1,1);
ue= zeros(N+1,1);

% initial profile
for j = 1:N+1
    x(j) = x0 + (j-1)*h;
    p(j) = u_in(x(j));
end

figure(1);
plot(x,p)
title('initial profile')
% time loop
t = t0;

for k = 1:M
    
    q(1)  = p(1) - mu*0.5*(p(2))+(mu^2)*0.5*(-2*p(1)+p(2));
    for j = 2:N
        q(j) = p(j) - mu*0.5*(p(j+1)-p(j-1))+(mu^2)*0.5*(p(j-1)-2*p(j)+p(j+1));
    end
    q(N+1) = p(N+1) + mu*0.5*(p(N))+(mu^2)*0.5*(p(N)-2*p(N+1));
    
    for i = 1:N+1
        ue(i) = u_ex(t,x(i));
    end
    figure(2)
    plot(x,q,'*',x,ue)
    pause(0.2)
    
    t = t + dt;
    p = q;
    
end

error = max(abs(ue-q))