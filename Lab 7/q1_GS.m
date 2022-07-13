clear all;
close all;

format long;

a = 0; b = 1; c = 0; d = 1;

h = 0.10;
N = (b-a)/h;
tol = 1e-6;

x = a:h:b;
y = c:h:d;

%u1 = zeros(N+1,N+1);
u2 = zeros(N+1,N+1);
uex = zeros(N+1,N+1);

for i = 1:N+1
    for j = 1:N+1
        u2(i,1)   = 0;
        u2(1,j)   = 0;
        u2(i,N+1) = 10*sin(pi*x(i));
    end
end

err = 1000;
k   = 0;
u1  = u2;
h1  = h*h;

while err > tol
    
    for j = 2:N
        for i = 2:N+1
            if i == N+1
                u1(i,j) = (2*u1(i-1,j)-20*h*pi*y(j)^2+u1(i,j-1)+u1(i,j+1)-h1*f1(x(i),y(j)))/4;
            else
                u1(i,j) = (u1(i-1,j)+u1(i+1,j)+u1(i,j-1)+u1(i,j+1)-h1*f1(x(i),y(j)))/4;
            end
        end
    end
    err = max(max(abs(u1 - u2)));
    u2  = u1;
    k   = k + 1;
end

figure(1);
mesh(x,y,u2);
title('approximate solution')

for i = 1:N+1
    for j = 1:N+1
        uex(i,j) = 10*y(j)^2*sin(pi*x(i));
    end
end

figure(2);
mesh(x,y,uex);
title('exact solution')

error = max(max(abs(u2-uex)))