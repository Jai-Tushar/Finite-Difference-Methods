clear all;
close all;

format long;

%domain
x0 = -2; xf = 3;
t0 =  0; tf = 1;

%parameters
N = 200;
h = (xf-x0)/N;
dt= 0.8*h;
mu= dt/h;
M = fix((tf-t0)/h);

%initialize vectors
x  = zeros(N+1,1);
p1 = zeros(N+1,1);
p2 = zeros(N+1,1);
q  = zeros(N+1,1);
ue = zeros(N+1,1);

% initial profile (k-1)th time level
for j = 1:N+1
    x(j) = x0 + (j-1)*h;
    p1(j)= u_inII(x(j));
end

figure(1);
plot(x,p1)
title('initial profile')

% Lax friedrich scheme for kth time level

t = dt;

p2(1) = 0.5*(p1(2)) - mu*0.5*(p1(2));
for j = 2:N
    p2(j) = 0.5*(p1(j+1)+p1(j-1)) - mu*0.5*(p1(j+1)-p1(j-1));
end
p2(N+1) = 0.5*(p1(N)) + mu*0.5*(p1(N));

% Leap frog scheme K+1th level


for k = 1:M
    
    t = t + dt;
    
    q(1) = p1(1) - mu*(p2(2));
    for j = 2:N
        q(j) = p1(j) - mu*(p2(j+1) - p2(j-1));
    end
    q(N+1) = p1(N+1) + mu*(p2(N));
    
    for i = 1:N+1
        ue(i) = u_exII(t,x(i));
    end
    figure(2);
    plot(x,q,'*',x,ue)
    pause(0.2)
    
    
    p1 = p2;
    p2 = q;
    
end

error = max(abs(ue-q))