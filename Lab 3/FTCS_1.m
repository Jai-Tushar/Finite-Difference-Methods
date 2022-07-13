clear all;
close all;

x0 = 0;
xN = 1;
N  = 50;
h  = (xN - x0)/N;
M  = 250;
k  = 0.54*h^2;
mu = k/h^2; 

for j = 1:N-1
    x(j) = j*h;
    U0(j) = sin(pi*x(j));
end

U1 = zeros(N-1,1);
t = 0;
for j = 1:M
    
    U1(1) = U0(1) + mu*(-2*U0(1) + U0(2)) + k*f(t,x(1));
    
    for i = 2:N-2
        U1(i) = U0(i) + mu*(U0(i-1) - 2*U0(i) + U0(i+1)) + k*f(t,x(i));
    end
    
    U1(N-1) = U0(N-1) + mu*(U0(N-2) - 2*U0(N-1)) + k*f(t,x(N-1));
    
    t = t + k;
    U0 = U1;
end

for j = 1:N-1
    exact(j) = exp(-t)*sin(pi*x(j));
end

error = max(abs( exact' - U1));

[U1 exact']

plot(x,exact,x,U1)


