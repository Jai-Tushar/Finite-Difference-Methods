clear all;
close all;

format long;

%domain
x0 = -2; xf = 3;
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
pq= zeros(N+1,1);
ue= zeros(N+1,1);

%initial profile
for j = 1:N+1
    x(j) = x0 + (j-1)*h;
    p(j) = u_in(x(j));
end

figure(1);
plot(x,p)
title('initial profile')

%time loop
t = t0;
for k = 1:M
    
    % Lax Friedrich Scheme
    pq(1) = 0.5*(p(2)) - 0.5*mu*(p(2));
    for j = 2:N
        pq(j) = 0.5*(p(j+1)+p(j-1)) - 0.5*mu*(p(j+1)-p(j-1));
    end
    pq(N+1) = 0.5*(p(N)) + 0.5*mu*(p(N));

%       % Upwind Scheme
%       pq(1) = p(1) - mu*(p(1));
%       for j =2:N
%           pq(j) = p(j) - mu*(p(j)-p(j-1));
%       end
%       pq(N+1) =  mu*(p(N));
      
    for i = 1:N+1
        ue(i) = u_ex(t,x(i));
    end
    
    plot(x,pq,'*',x,ue)
    pause(0.2)
    
    t = t + dt;
    p = pq;
    
end

error = max(abs(pq-ue))