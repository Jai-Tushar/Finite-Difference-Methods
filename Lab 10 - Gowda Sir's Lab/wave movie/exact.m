function w = exact(t,x)

if x-t < 0
    w = 1;
elseif x-t > 0 && x-t < 1
    w = 1 - (x-t);
else
    w = 0;
end

end