function yq=lax(yp)

%domain
x0 = -2;     xf = 3;
t0=0;       tf = 1;

%parameters
N = 200;
h = (xf-x0)/N;
dt = 0.8*h;
mu = dt/h;

%vectors

yq = zeros(N+1,1);
x = zeros(N+1,1);

for i = 1:N+1
    x(i) = x0 + (i-1)*h;
end


    t=dt;
    
    yq(1) = 0.5*yp(2) - mu*yp(2)*0.5; 
    for i = 2:N
        yq(i) = 0.5*(yp(i+1)+yp(i-1)) - mu*(yp(i+1) - yp(i-1))*0.5;
    end
    yq(N+1) = 0.5*(yp(N)) - mu*(-yp(N))*0.5; 
    
end