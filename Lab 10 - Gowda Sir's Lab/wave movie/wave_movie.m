close all;
clear all;

%domain
x0=-10; xf=10;
t0=-3;   tf=3;

%parameters
N=100;
h=(xf-x0)/N;
mu=1;
dt=mu*h;
M=fix((tf-t0)/dt);

%vectors
x  = zeros(N+1,1);
yp1= zeros(N+1,1);
yp2= zeros(N+1,1);
yq = zeros(N+1,1);

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

fig = figure;
Obj = VideoWriter('wave.avi');
Obj.FrameRate = 2.5;
open(Obj);



%time loop
t=dt;
for k=1:(M-1)
    t=t+dt;
    
    yq(1)=0;
    for i=2:N
        yq(i)=2*yp2(i)-yp1(i)+mu^2*(yp2(i-1)-2*yp2(i)+yp2(i+1));
    end
    yq(N+1)=0;
        
    figure(fig);
    plot(x,yq);
    ylim([-0.1 1])
    
    frame = getframe(gcf);
    writeVideo(Obj, frame);
    
    yp1=yp2;
    yp2=yq;
end

close(Obj);