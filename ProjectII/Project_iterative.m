close all; 
clear all;

%domain
a = 0;  b = 1;
c = 0;  d = 1;

alpha_vector=0:0.2:2;

for q=1:11

%parameters
N = 10;
h = (b-a)/N;
h1 = h*h;
global alpha
alpha = alpha_vector(q);
tol = 1e-8;

%space vectors
x = a:h:b;
y = c:h:d;


u2 = zeros(N+1,N+1); %initial cond included

u1 = ones(N+1,N+1);
usol=zeros(N+1,N+1);


%solution jacobi iteration
while max(max(abs(u1-u2))) > tol
    u1 = u2;
    for i = 2:N
        for j = 2:N
           u2(i,j) = ((1-alpha*h/2)*u1(i-1,j) + (1+alpha*h/2)*u1(i+1,j) + u1(i,j-1) + u1(i,j+1) - h1*f_iterative(x(i),y(j)))/(4-h1);
        end
    end
end


 figure(1);
 mesh(x,y,u2);
 title('The approximate solution')

for i=1:N+1
    for j=1:N+1
        usol(i,j)=sin(pi*x(i))*sin(pi*y(j));
    end
end

 figure(2);
 mesh(x,y,usol);
 title('The exact solution')

error(q) = max(max(abs(u2-usol)))
end

figure(3);
plot(alpha_vector,error)
xlabel('convection term');
ylabel('error')
