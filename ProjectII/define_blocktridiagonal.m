M = 4;
N = 4;
M1 = (M-1)*(N-1);

% Define ALL B blocks
e1 = 1*ones(M1,1);
e2 = -4*ones(M1,1);
e3 = 1*ones(M1,1);
A_T= spdiags([e1 e2 e3],-1:1,M1,M1);

% define ALL I blocks
e_I = ones(M1-(M-1),1);
A_I = spdiags(e_I,-(M-1),M1,M1);

A = A_T + A_I + A_I';

for i = 1:N-2
    A((N-1)*i,(N-1)*i+1) = 0;
    A((N-1)*i+1,(N-1)*i) = 0;
end

full(A)