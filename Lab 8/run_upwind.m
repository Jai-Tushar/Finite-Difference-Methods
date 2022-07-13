clear all;
close all;

format long;

%domain
x0 = 0; xf = 10;
t0 = 0 ; tf = 1;

%parameters
N = 200;
h = (xf - x0)/N;
dt= 0.8*h;
mu= dt/h;
M = fix((tf-t0)/h);

%initialize vectors
x = zeros(N+1,1);
p = zeros(N+1,1);
pq= zeros(N+1,1);
ue= zeros(N+1,1);

%initial profile
for j = 1:N+1
    x(j) = x0 + (j-1)*h;
    p(j) = u_inI(x(j));
end

figure(1);
plot(x,p)
title('initial profile')

% % time loop
% t = t0;
% for k = 1:M
%     pq(1) = p(1) - mu*(p(1));
%     for j = 2:N
%         pq(j) = p(j) - mu*(p(j) - p(j-1));
%     end
%     pq(N+1) =  p(N+1) - mu*(p(N+1) - p(N));
%     
%     for i = 1:N+1
%         ue(i) = u_exI(t,x(i));
%     end
%     
%     figure(2);
%     plot(x,pq,'*',x,ue)
%     title('exact solution vs approximate solution')
%     pause(0.2)
%     
%     t = t + dt;
%     p = pq;
%     
% end
% 
% error = max(abs(ue-pq))
