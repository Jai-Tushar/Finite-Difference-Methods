function z = u_ex(t,x)

if abs(x-t) < 1
    z = 1 - abs(x-t);
else
    z = 0;
end