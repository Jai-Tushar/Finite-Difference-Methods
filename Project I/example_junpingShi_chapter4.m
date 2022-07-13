clear all;
close all;

format long;

tic

N  = 50;
x0 = 0;
xN = 1;
% ti = 0;
% tf = 1;
lambda = .1;

h  = (xN - x0)/N;

dt = 0.0008;

U0 = zeros(N-1,1);

for j = 1:N-1
    
    x(j)  = j*h;
    U0(j) = sin(pi*x(j));
    
end

F  = zeros(N-1,1);
A  = zeros(N-1,N-1);
U1 = zeros(N-1,1);

mu = dt/(h^2);

U  = ones(N-1,1);       % INITIAL GUESS

error = 1000;
Tol   = 1.e-8;
t     = 0;

while error > Tol
    
    % Nonlinear equations
    
    F(1) = -(1+2*mu)*U(1) + mu*U(2) + lambda*dt*(U(1)-(U(1))^2) + U0(1);
    
    for j = 2:N-2
        
        F(j) = mu*U(j-1) - (1+2*mu)*U(j) + mu*(U(j+1)) + lambda*dt*(U(j)-(U(j))^2) + U0(j);
        
    end
    
    F(N-1) = mu*U(N-2) - (1+2*mu)*U(N-1) + lambda*dt*(U(N-1)-(U(N-1))^2) + U0(N-1);
    
% Jacobian Matrix    

A(1,1) = -(1+2*mu) + lambda*dt*(1-2*U(1));
A(1,2) = mu;
A(2,1) = mu;

for j = 2:N-2
    A(j,j)  = -(1+2*mu) + lambda*dt*(1-2*U(j));
    A(j,j+1)= mu;
    A(j+1,j)= mu;
end

A(N-1,N-1) = -(1+2*mu) + lambda*dt*(1-2*U(N-1));

LAMBDA = A\F;
U1 = U - LAMBDA;
error = max(abs(U1 - U));
U = U1;
t = t + dt;

end

for j = 1:N-1
    Uex(j)=exp(-t)*sin(pi*x(j));
end

error = abs(max(U1 - Uex'))

hold on
plot(x,U1,x,Uex,'ro')

toc