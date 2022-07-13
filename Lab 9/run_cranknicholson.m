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
A = zeros(N+1,N+1);
B = zeros(N+1,N+1);
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

A(1,1) = 1;
A(1,2) = mu/4;
A(2,1) = -mu/4;

for j = 2:N
    A(j,j) = 1;
    A(j+1,j) = -mu/4;
    A(j,j+1) = mu/4;
end

A(N,N+1)   = mu/4; 
A(N+1,N+1) = 1;

B(1,1) = 1;
B(1,2) = -mu/4;
B(2,1) = mu/4;

for j = 2:N
    B(j,j) = 1;
    B(j+1,j) = mu/4;
    B(j,j+1) = -mu/4;
end

B(N,N+1)   = -mu/4; 
B(N+1,N+1) = 1;

for k = 1:M
    
    
    
    q = A\(B*p);
    
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