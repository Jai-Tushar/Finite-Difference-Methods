function V = pde1(t,U)

global N h x

dU = zeros(N+1,1);

dU(1)   = (1/h^2)*(2*U(2) - 2*U(1)) + f(t,x(1)); % for j = 1

dU(N+1) = (1/h^2)*(2*U(N) - 2*U(N+1) + 2*h*((-exp(-t))*pi - U(N+1)));

for j = 2 : N 
    
    dU(j) = (1/h^2)*(U(j-1) - 2*U(j) + U(j+1)) + f(t,x(j));

end 

V = dU;