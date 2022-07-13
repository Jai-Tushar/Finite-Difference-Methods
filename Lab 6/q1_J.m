clear all;
close all;

format long;

a = 0; b = 1; c = 0; d = 1;

h = 0.025;
N = (b-a)/h;
tol = 1e-6;

x = a:h:b;
y = c:h:d;

u1 = zeros(N+1,N+1);
u2 = zeros(N+1,N+1);
uex= zeros(N+1,N+1);

% boundary conditions
for j = 1:N+1
    for i = 1:N+1
        u2(i,1)   = f1(x(i),0);
        u2(1,j)   = f1(0,y(j));
        u2(N+1,j) = f1(1,y(j));
        u2(i,N+1) = f1(x(i),1);
    end
end

h1 = h^2;  
k  = 0;
while max(max(abs(u1 - u2))) > tol
    
    k = k+1;
    u1= u2;
    
    for j = 2:N
        for i = 2:N
            u2(i,j) = (u1(i-1,j) + u1(i+1,j) + u1(i,j-1) + u1(i,j+1) + 4*h1*f1(x(i),y(j)))/4;
        end
    end
    
end

figure(1);
mesh(x,y,u2);
title('approximate solution')

for j = 1:N+1
    for i = 1:N+1
        uex(i,j) = f1(x(i),y(j));
    end
end

figure(2);
mesh(x,y,uex);
title('exact solution')

error = max(max(abs(u2 - uex)))