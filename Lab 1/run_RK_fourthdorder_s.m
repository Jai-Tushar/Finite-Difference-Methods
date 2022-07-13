global b

b = 0.4;

tmax = 25;
h = 0.01;
nstep = tmax/h;
t = 0:h:tmax;

y = zeros(2,nstep+1);
% try using ode45
y(:,1) = [1 2];

for n = 1:nstep
    k1 = h * fn_s(t(n), y(:,n));
    k2 = h * fn_s(t(n) + h/2, y(:,n) + k1/2);
    k3 = h * fn_s(t(n) + h/2, y(:,n) + k2/2);
    k4 = h * fn_s(t(n) + h  , y(:,n) + k3);
    y(:,n+1) = y(:,n) + (1/2)*(k1 + 2*k2 + 2*k3 +k4);
end

plot(t,y(1,:),t,(y(2,:)),'r')