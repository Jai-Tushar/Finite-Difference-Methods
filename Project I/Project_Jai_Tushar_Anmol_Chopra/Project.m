% clear all;
% close all;

format long

tic
N  = 42;

x0 = 0;
xN = 1;

h = (xN-x0)/N;

lambda = 1;
a = 1;
b = 1;

dt = 0.0001;
mu = dt/h^2;
M  = 100;

U0 = zeros(N-1,1); 

for j = 1:N-1
    
    x(j)  = j*h;
    U0(j) = sin(pi*x(j));
    
end

F  = zeros(N-1,1);
A  = zeros(N-1,N-1);
U1 = zeros(N-1,1);

U  = 0.5*ones(N-1,1);       % INITIAL GUESS

error = 100;
Tol   = 1.e-8;
t = 0;
n = 0;

while error > Tol

   
    % Nonlinear equations
    
    F(1) = -(1+2*mu)*U(1) + mu*U(2) + lambda*dt*(U(1)-(U(1))^2-((a*U(1))/(1+b*(U(1))))) + U0(1);
    
    for i = 2:N-2
        
        F(i) = mu*U(i-1) - (1+2*mu)*U(i) + mu*(U(i+1)) + lambda*dt*(U(i)-(U(i))^2-((a*U(i))/(1+b*(U(i))))) + U0(i);
        
    end
    
    F(N-1) = mu*U(N-2) - (1+2*mu)*U(N-1) + lambda*dt*(U(N-1)-(U(N-1))^2-((a*U(N-1))/(1+b*(U(N-1))))) + U0(N-1);
    
% Jacobian Matrix    

A(1,1) = -(1+2*mu) + lambda*dt*(1-2*U(1)-(a/((b*U(1)+1)^2)));
A(1,2) = mu;
A(2,1) = mu;

for j = 2:N-2
    A(j,j)  = -(1+2*mu) + lambda*dt*(1-2*U(j)-(a/((b*U(j)+1)^2)));
    A(j,j+1)= mu;
    A(j+1,j)= mu;
end

A(N-1,N-1) = -(1+2*mu) + lambda*dt*(1-2*U(N-1)-(a/((b*U(N-1)+1)^2)));

LAMBDA = A\F;
U1 = U - LAMBDA;
error = max(abs(U1 - U));
U = U1;
U0= U1;
t = t+dt;
n = n+1;
end








% % 
 hold on
 plot(x,U1,'b')
% % % figure;
% % % plot(log(h),log(error))

toc