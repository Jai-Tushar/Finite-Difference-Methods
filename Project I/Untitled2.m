clear all;
close all;

N = 50;


x0 = 0;
xN = 1;

h  = (xN - x0)/N;
M  = 100;
k  = 0.4*h^2;
mu = k/h^2; 
a = 1;
b = 1;
lambda = 1;
for j = 1:N-1
    x(j) = j*h;
    U0(j) = sin(pi*x(j));
end

U1 = zeros(N-1,1);
t = 0;
for j = 1:M
    
    U1(1) = U0(1) + mu*(-2*U0(1) + U0(2)) + lambda*k*(U0(1)-(U0(1))^2-(a*U0(1)/(1+b*U0(1))));
    
    for i = 2:N-2
        U1(i) = U0(i) + mu*(U0(i-1) - 2*U0(i) + U0(i+1)) + lambda*k*(U0(i)-(U0(i))^2-(a*U0(i)/(1+b*U0(i))));
    end
    
    U1(N-1) = U0(N-1) + mu*(U0(N-2) - 2*U0(N-1)) + lambda*k*(U0(N-1)-(U0(N-1))^2-(a*U0(N-1)/(1+b*U0(N-1))));
    
    t = t + k;
    U0 = U1;
end

for j = 1:N-1
      Uex(j) = exp(-t*pi^2)*sin(pi*x(j));  
end

error = max(abs(Uex' - U1));
U1

order
% hold on
plot(x,U1,x,Uex,'ro')