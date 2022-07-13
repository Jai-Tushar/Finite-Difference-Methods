clear all;
close all;

format long;

a = 0; b = 1; c = 0; d = 1;

N = 10;

for p = 1:3
    h(p) = (b-a)/N;
    M = N;
    tol = 1e-8;

    x = a:h(p):b;
    y = c:h(p):d;

    u1 = ones(N+1,N+1);
    u2 = zeros(N+1,N+1);
    uex= zeros(N+1,N+1);

    % boundary conditions
    for j = 1:M+1
        for i = 1:N+1
            u2(i,1)   = 0;
            u2(1,j)   = 0;
            u2(i,N+1) = 0;
            u2(M+1,j) = 0;
        end
    end

    h1 = h(p)^2;  
    k  = 0;
    while max(max(abs(u1 - u2))) > tol
    
        k = k+1;
        u1= u2;
    
        for j = 2:N
            for i = 2:N
                u2(i,j) = (u1(i-1,j)+u1(i+1,j)+u1(i,j-1)+u1(i,j+1)+(h(p)/2)*(u1(i+1,j)-u1(i-1,j))-h1*...
                        (-2*pi^2*ex_q6(x(i),y(j))+pi*cos(pi*x(i))*sin(pi*y(j))+ex_q6(x(i),y(j))))/(4-h1);
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

    error(p) = max(max(abs(u2 - uex)));
    
    [h' error']
    
    N = 2*N;
end