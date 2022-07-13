function w = initial(x)

if x < 0
    w = 1;
elseif x > 0 && x < 1
    w = 1 - (x);
else
    w = 0;
end

end