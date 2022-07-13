clear all;
close all;

format long;

N  = 10;


x0 = 0;
xN = 1;
t0 = 0;
tf = 1;

h  = (xN-x0)/N;
k  = 0.9*(2*h^2);
M  = fix((tf-t0)/k);


mu = k/(2*h^2);

x = zeros(N+1,1);
U0 = zeros(N+1,1);
for j =1:N+1
    x(j) = (j-1)*h;
    U0(j) = x(j)*(1-x(j));
end


A = zeros(N+1,N+1);

A(1,1) = 1+2*mu-2*h*mu;
A(1,2) = -2*mu;
A(2,1) = -mu;

for j = 2:N
    A(j,j) = 1+2*mu;
    A(j+1,j) = -mu;
    A(j,j+1) = -mu;
end

A(N+1,N)   = -2*mu;
A(N+1,N+1) = 1+2*mu;

B = zeros(N+1,N+1);

B(1,1) = 1-2*mu+2*h*mu;
B(1,2) = 2*mu;
B(2,1) = mu;

for j = 2:N
    B(j,j) = 1-2*mu;
    B(j+1,j) = mu;
    B(j,j+1) = mu;
end

B(N+1,N)   = 2*mu;
B(N+1,N+1) = 1-2*mu;

F = zeros(N+1,1);
U1 = zeros(N+1,1);
C  = zeros(N+1,1);
t = 0;

for j = 1:M
    
    F(1) = k*0.5*(f_cns(t,x(1))+f_cns(t+k,x(1))) - 2*h*mu*exp(-t) - 2*h*mu*exp(-t-k);
    
    for i = 2:N
        F(i) = k*0.5*(f_cns(t,x(i))+f_cns(t+k,x(i)));
    end
    
    F(N+1) = k*0.5*(f_cns(t,x(N+1))+f_cns(t+k,x(N+1))) - 2*h*mu*exp(-t) - 2*h*mu*exp(-t-k);
   
    C = B*U0 + F;
    U1 = A\C;
    t = t+k;
    U0=U1;
    
end
        
for j = 1:N+1
    uex(j) = exp(-t)*x(j)*(1-x(j));
end

error = max(abs(U1-uex'));





plot(x,U1,x,uex,'ro')

