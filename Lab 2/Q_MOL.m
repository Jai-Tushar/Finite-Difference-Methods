function V = Q_MOL(t,U)

global N h x 

dU = zeros(N+1,1);
UI = U(2) - 2*h*(exp(-t) - U(1));
UF = -2*h*exp(-t) + U(N);

dU(1) = (1/h^2)*(UI - 2*U(1) + U(2)) + f_MOL(t,x(1));

for j = 2:N
    dU(j) = (1/h^2)*(U(j-1) - 2*U(j) + U(j+1)) + f_MOL(t,x(j));
end

dU(N+1) = (1/h^2)*(U(N) - 2*U(N+1) + UF) + f_MOL(t,x(N+1));

V = dU;