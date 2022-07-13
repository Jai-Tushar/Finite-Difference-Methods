function V = LS2_Q2(t,U)

global N h x

dU = zeros(N+1,1);
U0 = 2*h*U(1) + U(2) - 2*h*exp(-t);
UF = -2*h*exp(-t) + U(N);

dU(1)   = (U0 - 2*U(1) + U(2))*(1/h^2) + f(t,x(1));
dU(N+1) = (U(N) - 2*U(N+1) + UF)*(1/h^2) + f(t,x(N+1));

for j = 2 : N
    dU(j) = (U(j-1) - 2*U(j) + U(j+1))*(1/h^2) + f(t,x(j));
end

V = dU;