clear all;
close all;

format long;

x0 = 0;
xN = 1;
N  = 50;
h  = (xN - x0)/N;
M  = 250;
k  = 0.4*h^2;
mu = k/h^2;

for j = 2:N
    x(j)  = (j-1)*h; 
    U0(j) = sin(pi*x(j));
end

U1 = zeros(N-1,1); 
t  = 0;

for j = 2:M
    
    U1(2) = U0(2) + mu*(-2*U0(2) + U0(3)) + k*f(t,x(2));
    
    for i = 3 : N-1
        U1(i) = U0(i) + mu*(U0(i-1) - 2*U0(i) + U0(i+1)) + k*f(t,x(i));
    end
    
    U1(N) = U0(N) + mu*(U0(N-1) - 2*U0(N)) + k*f(t,x(N));
    
    t = t + k;
    U0 = U1;
end

for j = 2:N
     
    exact(j) = exp(-t)*sin(pi*x(j))*(pi^2-1);
end

error = max(abs(U1 - exact'));

[U1 exact']

plot(x,U1,x,exact)
