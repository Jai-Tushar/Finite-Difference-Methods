function w = u_exII(t,x)

if abs(x-t) < 1
    w = 1 - abs(x-t);
else
    w = 0;
end

end