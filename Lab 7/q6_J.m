clear all;
close all;

format long;

a = 0; b = 1; c = 0; d = 1;


N = 10;
h=(b-a)/N;
M=N;
tol = 1e-8;

x = a:h:b;
y = c:h:d;

u1 = zeros(N+1,N+1);  % Because the dirichlet boundary conditions are all zero
u1(end,end)=0.1;      % the code does not enter the while loop.
                      % So this is done so that the code enters the while loop.
                      % we can also initialize u1 as ones(N+1,N+1)

u2 = zeros(N+1,N+1);
uex= zeros(N+1,N+1);

% boundary conditions
for j = 1:M+1
    for i = 1:N+1
        u2(i,1)   = 0;
        u2(1,j)   = 0;
        u2(i,M+1) = 0;
    end
end

h1 = h^2;  
k  = 0;
while max(max(abs(u1 - u2))) > tol
    
    k = k+1;
    u1= u2;
   
    
    for i = 2:N+1
        for j = 2:N
            if i == N+1
               u2(i,j) = (2*u1(i-1,j)-2*h*pi*sin(pi*y(j))+p_q6(x(i),y(j))*(u1(i,j-1)+u1(i,j+1))-h1*f_q6(x(i),y(j)))/...
                            (2+2*p_q6(x(i),y(j))-h1*r_q6(x(i),y(j)));
            else
               u2(i,j) = (u1(i-1,j)+u1(i+1,j)+p_q6(x(i),y(j))*(u1(i,j-1)+u1(i,j+1))-h1*f_q6(x(i),y(j)))/...
                            (2+2*p_q6(x(i),y(j))-h1*r_q6(x(i),y(j)));
            end
        end
    end
end

figure(1);
mesh(x,y,u2);
title('approximate solution')

for j = 1:N+1
    for i = 1:N+1
        uex(i,j) = ex_q6(x(i),y(j));
    end
end

figure(2);
mesh(x,y,uex);
title('exact solution')

error = max(max(abs(u2 - uex)))