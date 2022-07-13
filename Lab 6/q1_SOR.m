clear all;
close all;

a = 0; b = 1; c = 0; d = 1;
h = 0.1;
N = (b-a)/h;
M = N;

x = a:h:b;
y = c:h:d;

u2 = zeros(N+1,M+1);
uex= zeros(N+1,M+1);



for j = 1:M
    for i = 1:N
        u2(i,1)     = f1(x(i),0);
        u2(1,j)   = f1(0,y(j));
        u2(N+1,j) = f1(1,y(j));
        u2(i,N+1) = f1(x(i),1);
    end
end
err = 1000;
k   = 0;
u1  = u2;
h1  = h*h;
tol = 1e-6;
omega = 1.8;
while err > tol
    
    for j = 2:M
        for i = 2:N
            u1(i,j) = (1-omega)*u2(i,j) + omega*(u1(i-1,j)+u1(i+1,j)+u1(i,j-1)+u1(i,j+1)+4*h1*f1(x(i),y(j)))/4;
        end
    end
    err = max(max(abs(u1-u2)));
    k = k + 1;
    u2 = u1;
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