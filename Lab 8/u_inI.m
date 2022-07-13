function w = u_inI(x)

if x <= 0
    w = 0;
elseif x >= 0 & x <= 0.5
    w = x;
elseif x >= 0.5 & x <= 1
    w = 1 - x;
elseif x >= 1
    w = 0;
end

end