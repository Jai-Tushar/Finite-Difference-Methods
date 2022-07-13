clear all;
close all;

format long;

a = 0; b = 2; c = 0; d = 1;
h = 0.1;
N = (b-a)/h;
M = (d-c)/h;
tol = 1e-6;

x = a:h:b;
y = c:h:d;

u1 = zeros(N+1,M+1);
u2 = zeros(N+1,M+1);
uex= zeros(N+1,M+1);

for j = 1:M+1
    for i = 1:N+1
        u2(i,1)  = 1;
        u2(1,j)  = 1;
        u2(N+1,j)= exp(2*y(j));
        u2(i,M+1)= exp(x(i));
    end
end

k = 0;
h1 = h*h;
while max(max(abs(u2 - u1))) > tol
    
    u1 = u2;
    k  = k + 1;
    
    for j = 2:M
        for i = 2:N
            u2(i,j) = (u1(i-1,j)+u1(i+1,j)+u1(i,j-1)+u1(i,j+1)-h1*f2(x(i),y(j)))/4;
        end
    end
    
end

figure(1);
mesh(x,y,u2');
title('approximate solution')

for i = 1:N+1
    for j = 1:M+1
        uex(i,j) = exp(x(i)*y(j));
    end
end

figure(2);
mesh(x,y,uex');
title('exact solution')

error = max(max(abs(u2 - uex)))