clear all;
close all;

x0 = 0;
xN = 1;
N  = 40;
h  = (xN-x0)/N;
k  = 0.0001;
mu = k/h^2;
tol= 1e-8;
err= 1000;

J = zeros(N-1,N-1);
F = zeros(N-1,1);
U1= zeros(N-1,1);
U0= zeros(N-1,1);

U = 0.05*ones(N-1,1);

t = 0;
n = 0;

lambda = 1;
a = 1;
b = 1;

for j = 1:N-1
    x(j) = j*h;
    U0(j)= sin(pi*x(j));
end

while err > tol
    
F(1) = U0(1) + mu*(-2*U(1)+U(2)) + k*lambda*(U(1)-U(1)^2-((a*U(1))/(1+b*U(1)))) - U(1);
for j = 2:N-2
    F(j) = U0(j) + mu*(U(j-1)-2*U(j)+U(j+1)) + k*lambda*(U(j)-U(j)^2-((a*U(j))/(1+b*U(j)))) - U(j);
end
F(N-1) = U0(N-1) + mu*(U(N-2)-2*U(N-1)) + k*lambda*(U(N-1)-U(N-1)^2-((a*U(N-1))/(1+b*U(N-1)))) - U(N-1);

J(1,1) = -2*mu + k*lambda*(1-2*U(1)-(a/((1+b*U(1))^2))) - 1;
J(1,2) = mu;
J(2,1) = mu;

for j = 2:N-2
    J(j,j)   = -2*mu + k*lambda*(1-2*U(j)-(a/((1+b*U(j))^2))) - 1;
    J(j,j+1) = mu;
    J(j+1,j) = mu;  
end

J(N-1,N-2) = mu;
J(N-1,N-1) = -2*mu + k*lambda*(1-2*U(N-1)-(a/((1+b*U(N-1))^2))) - 1;

LAMBDA = J\F;
U1 = U - LAMBDA;
err = max(abs(U1 - U));
U = U1;
U0= U1;
t = t+k;
n = n+1;

end

for j = 1:N-1
    uex(j) = exp(-t*pi^2)*sin(pi*x(j));
end

error = max(abs(U1 - uex'))

plot(x,U1,x,uex,'ro')