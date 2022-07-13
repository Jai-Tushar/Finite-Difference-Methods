%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%               Method of lines                       %%%%
%%%         u_t = u_{xx} + f(x, t), 0 < x < 1, t > 0     %%%%
%%%              u(x, 0) = sin(pi*x),                    %%%%  
%%%              u(0, t) = u(1, t) = 0,                  %%%%
%%%  Exact soln: u(x, t) = exp(-t)*sin(pi*x)             %%%%
%%%        Here f(x, t) = exp(-t)*sin(pi*x)*(pi^2 - 1);  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function V = molrhs(t,u)

global N h x

dU = zeros(N-1,1);
dU(1) = (-2*u(1) + u(2))/(h^2) + f(t,x(1)); 
dU(N-1) = (u(N-2)-2*u(N-1))/(h^2) + f(t,x(N-1));

for j = 2:N-2
    dU(j) = (u(j-1)-2*u(j)+u(j+1))/(h^2) + f(t,x(j)); 
end

V = dU;