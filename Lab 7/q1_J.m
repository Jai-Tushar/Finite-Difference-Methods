clear all;
close all;

format long;
% domain
a = 0; b = 1; c = 0; d = 1;
% parameters
h = 0.10;
N = (b-a)/h;
tol = 1e-6;
% discretization
x = a:h:b;
y = c:h:d;
% initialize
u1 = zeros(N+1,N+1);
u2 = zeros(N+1,N+1);
uex= zeros(N+1,N+1);

% boundary conditions
for j = 1:N+1
    for i = 1:N+1
        u2(i,1)   = 0;
        u2(1,j)   = 0;
        u2(i,N+1) = 10*sin(pi*x(i));
    end
end
% tolerance loop
h1 = h^2;  
k  = 0;
while max(max(abs(u1 - u2))) > tol
    
    k = k+1;
    u1= u2;
    
    for j = 2:N
        for i = 2:N+1
            if i == N+1
               u2(i,j) = (2*u1(i-1,j) - 20*h*pi*y(j)^2 + u1(i,j-1) + u1(i,j+1) - h1*f1(x(i),y(j)))/4; 
            else
               u2(i,j) = (u1(i-1,j) + u1(i+1,j) + u1(i,j-1) + u1(i,j+1) - h1*f1(x(i),y(j)))/4;
            end
        end
    end
end
% plot
figure(1);
mesh(x,y,u2);
title('approximate solution')
% exact sol 
for j = 1:N+1
    for i = 1:N+1
        uex(i,j) = 10*y(j)^2*sin(pi*x(i));
    end
end
% plot
figure(2);
mesh(x,y,uex);
title('exact solution')
% error
error = max(max(abs(u2 - uex)))