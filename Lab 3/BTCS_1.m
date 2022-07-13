clear all;
close all;

format long;

x0 = 0;
xN = 1;
N  = 50;
h  = (xN - x0)/N;

for j = 1:N-1
    x(j)  = j*h;
    U0(j) = sin(pi*x(j));
end


k  = 0.8*h^2;
mu = k/h^2;
tI = 0;
tF = 1;
nt = (tF - tI)/k;

A = zeros(N-1,N-1);
b = zeros(N-1,1);

A(1,1) = (1+2*mu);
A(1,2) = -mu;
A(2,1) = -mu;

for j = 2:N-2
    A(j,j)   = 1 + 2*mu;
    A(j+1,j) = -mu;
    A(j,j+1) = -mu;
end

A(N-1,N-2) = -mu;
A(N-1,N-1) = 1+2*mu;

t  = 0;
U1 = zeros(N-1,1);

for j = 1:nt
    for i = 1:N-1
        b(i) = U0(i) + k*f(t,x(i));
    end
    
    U1 = A\b;
    U0 = U1;
    t = t + k;
    
end

for j = 1:N-1
     exact(j) = exp(-t)*sin(pi*x(j));
 end
 
 error = max(abs(exact'-U1));

 [U1, exact']
 
 plot(x, exact, x, U1)