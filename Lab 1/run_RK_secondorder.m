tmax = 50;
h = 0.01;
nstep = tmax/h;
t = 0:h:tmax;

y = zeros(3,nstep+1);

y(:,1) = [-10 10 25];

for n = 1:nstep
    k1 = h * fn(t(n), y(:,n));
    k2 = h * fn(t(n) + h, y(:,n) + k1);
    y(:,n+1) = y(:,n) + (1/2)*(k1+k2);
end

plot3(y(1,:),y(2,:),y(3,:))