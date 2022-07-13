clear all;
close all;

format long;

tic
% Define omega
a = 0; b = 1; c = 0; d = 1;

% define parameters
N = 40;
M = 40;        % N = M in our problem
h = (b-a)/N;   % uniform partition in both directions

% in the x-direction
x = zeros(N-1,1);
for i = 1:N-1
    x(i)  = h*i;
end

% in the y-direction
y = zeros(M-1,1);
for j = 1:M-1
    y(j)  = h*j;
end

M1 = (M-1)*(N-1);
F = zeros(M1,1);
h1 = h^2;

for j = 1:N-1
    for i = 1:M-1
        k = i + (M-1)*(j-1);
        F(k) = f(x(i),y(j));
    end
end

% %define block B
% B = zeros(N-1,N-1);
% 
% B(1,1) = -4/h1;
% B(1,2) = 1/h1;
% B(2,1) = 1/h1;
% 
% for k = 2:N-2
%     
%     B(k,k) = -4/h1;
%     B(k+1,k) = 1/h1;
%     B(k,k+1) = 1/h1;
% end
% 
% B(N-1,N-2) = 1/h1;
% B(N-1,N-1) = -4/h1;
% 
% % Concatenate A
% blocks = repmat({B}, N-1, 1);
% res = blkdiag(blocks{:});
% 
% R = repmat(1/h1,1,M1-(M-1));
% I1 = diag(R,M-1);
% I2 = diag(R,-(M-1));
% 
% A = res+I1+I2;


% Define ALL B blocks
e   = (1/h1)*ones(M1,1);
A_T = spdiags([e -4*e e],-1:1,M1,M1);

% define ALL I blocks
e_I = (1/h1)*ones(M1-(M-1),1);
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

e = max(max(abs(Uapp-Uex)))        % The maximum error

surf(x,y,Uapp); 
title('The Approximate solution plot'); 
xlabel('x'); 
ylabel('y');

figure(2); 
surf(x,y,Uex); 
title('The Exact solution plot'); 
xlabel('x');
ylabel('y');

toc