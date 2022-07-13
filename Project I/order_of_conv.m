load('A.dat');
load('newU1.dat');

[A newU1]


error = max(abs(A - newU1))


order = log(error)/log(2);
