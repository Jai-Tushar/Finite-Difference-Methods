a = 0; b= 1; c = 0; d = 1;

N = 40;
M = N;
h = (b-a)/N;

x = zeros(N-1,1);
for i = 1:N-1
    x(i) = i*h;
end
y = zeros(M-1,1);
for j = 1:M-1
    y(j) = j*h;
end

h1 = h*h;
M1 = (M-1)*(N-1);
F  = zeros(M1,1);

for j = 1:M-1
    for i = 1:N-1
        k   = i + (M-1)*(j-1);
        F(k)= f(x(i),y(j));
    end
end

e   = (1/h1)*ones(M1,1);
A_T = spdiags([e -4*e e], -1:1, M1, M1);

e_I = (1/h1)*ones(M1-(M-1),1);
A_I = spdiags(e_I,-(M-1),M1,M1);

A = A_T + A_I + A_I';

for i = 1:N-2
    A((N-1)*i,(N-1)*i+1) = 0;
    A((N-1)*i+1,(N-1)*i) = 0;
end

U = A\F;

j = 1;
for k = 1:M1
    i = k - (M-1)*(j-1);
    Uap(i,j) = U(k);
    Uex(i,j) = exact(x(i),y(j));
    j = fix(k/(M-1)) + 1;
end

error = max(max(abs(Uap - Uex)))

surf(x,y,Uap); 
title('The Approximate solution plot'); 
xlabel('x'); 
ylabel('y');

figure(2); 
surf(x,y,Uex); 
title('The Exact solution plot'); 
xlabel('x');
ylabel('y');
    