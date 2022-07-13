%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%          Backward Time Central Space                %%%%
%%%         u_t = u_{xx} + f(x, t), 0 < x < 1, t > 0     %%%%
%%%              u(x, 0) = sin(pi*x),                    %%%%  
%%%              u(0, t) = u(1, t) = 0,                  %%%%
%%%  Exact soln: u(x, t) = exp(-t)*sin(pi*x)             %%%%
%%%        Here f(x, t) = exp(-t)*sin(pi*x)*(pi^2 - 1);  %%%%
%%%        Course: MATH F422, Dr. P. Dhanumjaya          %%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

format long;

x0 = 0;
xN = 1;
tinit = 0;
tfinal = 1;

N = 80;

h = (xN-x0)/N;

delt = 0.0008;

nt = (tfinal-tinit)/delt;

for j = 1:N-1
    x(j) = j*h;
    U0(j) = sin(pi*x(j));
end

U1 = zeros(N-1,1);

tau = delt/(h^2);
 
A = zeros(N-1,N-1);
b = zeros(N-1,1);

A(1,1) = (1+2*tau);
A(1,2) = -tau;
A(2,1) = -tau;

for j = 2:N-2
A(j,j) = (1+2*tau);
A(j+1,j) = -tau;
A(j,j+1) = -tau;
end

A(N-1,N-2) = -tau;
A(N-1,N-1) = (1 +2*tau);

t = 0;

for j = 1:nt
    for i = 1:N-1
        b(i) = U0(i) + delt*f(t,x(i));
    end
    U1 = A\b;
    U0 = U1;
    t = t + delt;
end
 
 for k = 1:N-1
     exact(k) = exp(-t)*sin(pi*x(k));
 end
 
 error = max(abs(exact'-U1));

 [U1, exact']
 
 plot(x, exact, x, U1)
