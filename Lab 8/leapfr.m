%%%%%%%%% The Upwind Scheme (FT-BS) %%%%%%%%%%%%%%%%%%%%

clear all;
close all;
%domain
x0 = -2;     xf = 3;
t0=0;       tf = 1;

%parameters
N = 200;
h = (xf-x0)/N;
dt = 0.8*h;
mu = dt/h;
M = fix((tf-t0)/dt);

%vectors
yp1 = zeros(N+1,1);
yp2 = zeros(N+1,1);
yq = zeros(N+1,1);
x = zeros(N+1,1);
uex=zeros(N+1,1);

for i = 1:N+1
    x(i) = x0 + (i-1)*h;
    yp1(i) = uinit(x(i));
end

figure(1)
plot(x,yp1)
title('Initial Profile')

yp2=lax(yp1);




t = dt;
for k = 1:M
    t=t+dt;
    
    yq(1) = yp1(1) -mu*(yp2(2));    
    for i = 2:N
        yq(i) = yp1(i) -mu*(yp2(i+1) - yp2(i-1));
    end 
    yq(N+1) = yp1(N+1) -mu*(- yp2(N)); 
    
    for i = 1:N+1
    uex(i) = Uexact(t,x(i));
    end
    
    figure(2);
    plot(x,yq,'*',x,uex);
    pause(0.2)
    
    yp1 = yp2;
    yp2 = yq;
end

err = max(abs(uex-yq))

figure(3);
plot(x,yq,':',x,uex);
title('final soln');