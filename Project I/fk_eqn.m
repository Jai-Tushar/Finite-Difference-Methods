%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% u_t=u_xx+lambda*u*(1-u) %%%%%%%%%%%%%%%%%%
%%%%%%%% IC: u(0,x)=sin(pi*x)    %%%%%%%%%%%%%%%%%%
%%%%%%%% BC: u(t,0)=0,           %%%%%%%%%%%%%%%%%%
%%%%%%%%     u(t,1)=0; t>0       %%%%%%%%%%%%%%%%%%
%%%%%    u(t,x)= exp(-pi^2*lambda*t)*sin(pi*x)%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
format long;
N=100;
x0=0;
xN=1;
t0=0;
tN=1;
lambda=.1;
h=(xN-x0)/N;
dt=0.0001;
for j=1:N-1
    x(j)=j*h;
    U0(j)=sin(pi*x(j));
end
F=zeros(N-1,1);
A=zeros(N-1,N-1);
U1=zeros(N-1,1);
mu=dt/(h^2);
nt=fix((tN-t0)/dt);
U=ones(N-1,1);
error=1000;
tol=1.e-8;
k1=0;
t=0;
while error>tol
    F(1)=(1+2*mu)*U(1)-mu*U(2)-lambda*dt*U(1)+lambda*dt*(U(1)*U(1))-U0(1);
    for i=2:N-2
         F(i)=-mu*U(i-1)+(1+2*mu)*U(i)-mu*U(i+1)-lambda*dt*U(i)+lambda*dt*(U(i)*U(i))-U0(i);
    end
    F(N-1)=-mu*U(N-2)+(1+2*mu)*U(N-1)-lambda*dt*U(N-1)+lambda*dt*(U(N-1)*U(N-1))-U0(N-1);
    for i=1:N-1
        A(i,i)=1+2*mu-lambda*dt+2*lambda*dt*U(i);
    end
    for i=1:N-2
        A(i,i+1)=-mu;
        A(i+1,i)=-mu;
    end
    DT=A\F;
    U1=U-DT;
    k1=k1+1;
    error=max(abs(U1-U));
    U=U1;
    t=t+dt;
end

for j=1:N-1
%     Ue(j)=exp(-pi^2*lambda*t)*sin(pi*x(j));
      Ue(j)=exp(-pi^2*t)*sin(pi*x(j));
end

[U1 Ue']
err=max(abs(U1-Ue'))

plot(x,U1,'b',x,Ue,'ro')