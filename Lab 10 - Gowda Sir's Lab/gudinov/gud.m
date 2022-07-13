close all 
clear all
xi=-5;
xN=5;

ti=0;
tf=2;
N = 200;
h = (xN-xi)/N;
k= 0.75*h;
mu= k/h;

M = fix((tf-ti)/k);

x = zeros(N+1,1);
yp = zeros(N+1,1);
yq = zeros(N+1,1);

for i=1:N+1
    x(i)=xi+(i-1)*h;
    yp(i)=Uin(x(i));
end

figure(1)
plot(x,yp)
title('Initial Profile');
    

t=0;

for i=1:M

    yq(1)= yp(1)-(yp(1)-1)*mu;
    for j=2:N
        yq(j)= yp(j)-mu*(FGud(yp(j),yp(j+1))-FGud(yp(j-1),yp(j)));
    end
    yq(N+1)= 0.5*(yp(N))-mu*0.5*(-yp(N));

    figure(2)
    plot(x,yq)
%     pause(0.5);
    title('progressive wave');
    
    yp=yq;
    t=t+k;
end

for i=1:N+1
    exact(i)= Uexact(t,x(i));
end

error = max(abs(yq-exact'))

figure(3)
plot(x,yq,':',x,exact);
title('Approx Vs Exact');

t=0;