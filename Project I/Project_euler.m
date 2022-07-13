clear all;
close all;

N = 100;

for p = 1:5
x0 = 0;
xN = 1;

h(p)  = (xN - x0)/N;
M  = 100;
k  = 0.4*h(p)^2;
mu = k/h(p)^2; 
a = 1;
b = 1;
lambda = 1;
for j = 1:N-1
    x(j) = j*h(p);
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

error(p) = max(abs(Uex' - U1));
N = 2*N;
end
% [U1 exact']
for q = 1:p-1
    order(q) = (log(error(q)/error(q+1)))/(log(h(q)/h(q+1)));
end

order
% hold on
figure(1);
plot(x,U1,x,Uex,'ro')
title('solution plot')
xlabel('approximate solution')
ylabel('exact solution')

figure(2);
plot(log(h),log(error))
title('error plot')
xlabel('log(h)')
ylabel('log(error)')

