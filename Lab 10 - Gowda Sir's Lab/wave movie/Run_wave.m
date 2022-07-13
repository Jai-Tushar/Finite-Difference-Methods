close all;
clear all;

%domain
x0=-10; xf=10;
t0=-3;   tf=3;


%parameters
mu=3/4;
dt=0.01;
h=dt/mu;
N=fix((xf-x0)/h);
M=fix((tf-t0)/dt);

%vectors
x  = zeros(N+1,1);
yp1= zeros(N+1,1);
yp1_1=zeros(N+1,1);
yp2= zeros(N+1,1);
yp2_1=zeros(N+1,1);
yq = zeros(N+1,1);
yq_1=zeros(N+1,1);


%initial cond
for i=1:N+1
    x(i)=x0+(i-1)*h;
    yp1(i)=wave_in(x(i));
end

%calculating yp2 at t=t0+dt
yp2(1)=0;
for i=2:N
    yp2(i)=0.5*(mu^2*yp1(i-1) + 2*(1-mu^2)*yp1(i) + mu^2*yp1(i+1));
end
yp2(N+1)=0;

%calculating yp2_1 at t=t0+dt
yp2_1(1)=0;
for i=2:N
    yp2_1(i)=0.5*(yp1(i-1) + yp1(i+1));
end
yp2_1(N+1)=0;

%time loop
t=dt;
yp1_1=yp1;
for k=1:(M-1)
    t=t+dt;
    
    yq(1)=0;
    for i=2:N
        yq(i)=2*yp2(i)-yp1(i)+mu^2*(yp2(i-1)-2*yp2(i)+yp2(i+1));
    end
    yq(N+1)=0;
    
      yq_1(1)=0;
    for i=2:N
        yq_1(i)=2*yp2_1(i)-yp1_1(i)+(yp2_1(i-1)-2*yp2_1(i)+yp2_1(i+1));
    end
    yq_1(N+1)=0;
    
    
    
    figure(2);
    plot(x,yq,'r',x,yq_1);
     ylim([-0.5 1])
    pause(0.2)
    
    yp1=yp2;
    yp2=yq;
    
    
    yp1_1=yp2_1;
    yp2_1=yq_1;
end




