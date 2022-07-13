clear all;
close all;

format long;

tic

% Define omega
a = 0; b = 1; c = 0; d = 1;

alpha_vector=0:0.2:2;

for q = 1:11
    
% define parameters
N = 100;
M = 100;        % N = M in our problem
h = (b-a)/N;    % uniform partition in both directions
global alpha
alpha = alpha_vector(q);

% in the x-direction
x = zeros(N-1,1);
for i = 1:N-1
    x(i)  = h*i;
end

% in the y-direction
y = zeros(M-1,1);
for j = 1:M-1
    y(j) = h*j;
end

M1 = (M-1)*(N-1);
F = zeros(M1,1);
h1 = h^2;

for j = 1:N-1
    for i = 1:M-1
        k = i + (M-1)*(j-1);
        F(k) = h1*f(x(i),y(j));
    end
end

% Define block tridiagonal Matrix

% Define ALL B blocks
e1 = ones(M1,1);
e2 = (h1*alpha - 4)*ones(M1,1);
e3 = ones(M1,1);
A_T= spdiags([e1 e2 e3],-1:1,M1,M1);

% define ALL I blocks
e_I = ones(M1-(M-1),1);
A_I = spdiags(e_I,-(M-1),M1,M1);


A = A_T + A_I + A_I';

for i = 1:N-2
    A((N-1)*i,(N-1)*i+1) = 0;
    A((N-1)*i+1,(N-1)*i) = 0;
end


 U = A\F; 


% Transform 1D back to 2D array
j = 1;
for k=1:M1
  i = k - (j-1)*(M-1) ;
  Uapp(i,j) = U(k);
  Uex(i,j) = exact(x(i),y(j));
  j = fix(k/(M-1)) + 1;
end

surf(x,y,Uapp); 
title('The Approximate solution plot'); 
xlabel('x'); 
ylabel('y');

figure(2); 
surf(x,y,Uex); 
title('The Exact solution plot'); 
xlabel('x');
ylabel('y');

error(q) = max(max(abs(Uapp-Uex)))        % The maximum error

end

figure(3);
plot(alpha_vector,error)
xlabel('alpha_vector');
ylabel('error');

toc