M = 100;
N = M;
h = 1/M;
M1 = (M-1)*(N-1);


F = zeros(M1,1);



h1 = h^2;

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

for j = 1:N-1
    for i = 1:M-1
        k = i + (M-1)*(j-1);
        F(k) = f(x(i),y(j));
    end
end

% define block B
B = zeros(N-1,N-1);

B(1,1) = -4/h1;
B(1,2) = 1/h1;
B(2,1) = 1/h1;

for k = 2:N-2
    
    B(k,k) = -4/h1;
    B(k+1,k) = 1/h1;
    B(k,k+1) = 1/h1;
end

B(N-1,N-2) = 1/h1;
B(N-1,N-1) = -4/h1;

% Concatenate A
blocks = repmat({B}, N-1, 1);
res = blkdiag(blocks{:});

R = repmat(1/h1,1,M1-(M-1));
I1 = diag(R,M-1);
I2 = diag(R,-(M-1));

A = res+I1+I2;

tic
 U = A\F; 
toc