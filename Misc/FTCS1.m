%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%          Forward Time Central Space                 %%%%
%%%         u_t = u_{xx} + f(x, t), 0 < x < 1, t > 0     %%%%
%%%              u(x, 0) = sin(pi*x),                    %%%%  
%%%              u(0, t) = u(1, t) = 0,                  %%%%
%%%  Exact soln: u(x, t) = exp(-t)*sin(pi*x)             %%%%
%%%        Here f(x, t) = exp(-t)*sin(pi*x)*(pi^2 - 1);  %%%%
%%%             Course: MATH F422, Dr. P. Dhanumjaya     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

format long;

x0 = 0;
xN = 1;
N = 50;


M = 250;

h = (xN-x0)/N;

k = 0.5*h^2;

for j = 1:N-1
    x(j) = j*h;
    U0(j) = sin(pi*x(j));
end

U1 = zeros(N-1,1);

 lambda = k/h^2;

t = 0;
 for j=1:M
   
     U1(1)= U0(1) + lambda*(-2*U0(1) + U0(2)) + k*f(t,x(1));
   
  for i=2:N-2
     U1(i) = U0(i) + lambda*(U0(i-1)-2*U0(i)+U0(i+1)) + k*f(t,x(i));
  end
   
   U1(N-1) = U0(N-1) + lambda*(U0(N-2)-2*U0(N-1)) + k*f(t,x(N-1));
   
   t = t + k;
   U0 = U1;
   
 end

 for j = 1:N-1
     exact(j) = exp(-t)*sin(pi*x(j));
 end
 
 error = max(abs(U1-exact'));
 

[U1, exact']
 
 plot(x, exact, x, U1)

