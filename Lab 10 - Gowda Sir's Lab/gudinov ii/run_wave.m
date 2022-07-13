close all;
clear all;

%domain
x0=-10; xf=10;
t0=0;   tf=20;

%parameters
N=400;
h=(xf-x0)/N;
% mu=1;
% dt=mu*h;
dt=0.8*h;
mu = dt/h;
M=fix((tf-t0)/dt);

%vectors
x=zeros(N+1,1);
yp1=zeros(N+1,1);
yp2=zeros(N+1,1);
yq=zeros(N+1,1);
uex=zeros(N+1,1);



%initial cond
for i=1:N+1
    x(i)=x0+(i-1)*h;
    yp1(i)=Uin(x(i));
end

%plotting initial profile
figure(1);
plot(x,yp1);
title('initial profile');

% %calculating yp2 at t=t0+dt
% yp2(1)=0;
% for i=2:N
%     yp2(i)= yp1(i) - mu*(FGud(yp1(i),yp1(i+1)) - FGud(yp1(i-1),yp1(i)));
% end
% yp2(N+1)=0;

%time loop
t=t0;
for k=1:(M)
    t=t+dt;
    
    yq(1)=yp1(1) - mu*(FGud(yp1(1),yp1(2)) - FGud(0,yp1(1)));
    for i=2:N
        yq(i)=yp1(i) - mu*(FGud(yp1(i),yp1(i+1)) - FGud(yp1(i-1),yp1(i)));    
        
    end
    yq(N+1)=yp1(N+1) - mu*(FGud(yp1(N+1),0) - FGud(yp1(N),yp1(N+1)));
    
    
    figure(2);
    plot(x,yq)
     axis([0 1 0 1]);
%     pause(0.1)
    
    
%     yp1=yp2;
    yp1=yq;
end

% plot(x,t)


