tmax = 1;
h = 0.1;
nstep = tmax/h;
t = 0:h:tmax;

% y = zeros(3,nstep+1);
y = zeros(2,nstep+1);

% y(:,1) = [-10 10 25];

y(:,1) = [3 0];

for n = 1:nstep
    k1 = h * fn(t(n), y(:,n));
    k2 = h * fn(t(n) + h/2, y(:,n) + k1/2);
    k3 = h * fn(t(n) + h/2, y(:,n) + k2/2);
    k4 = h * fn(t(n) + h  , y(:,n) + k3);
    y(:,n+1) = y(:,n) + (1/6)*(k1 + 2*k2 + 2*k3 +k4);
end

% plot3(y(1,:),y(2,:),y(3,:))
% plot(t,y(1,:),t,(y(2,:)),'r')

plot(t,y(2,:))
figure;
plot(y(1,:),y(2,:))