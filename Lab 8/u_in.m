function z = u_in(x)

if abs(x) < 1
    z = 1 - abs(x);
else
    z = 0;
end