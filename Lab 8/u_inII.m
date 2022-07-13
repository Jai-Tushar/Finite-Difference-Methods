function v = u_inII(x)

if abs(x) < 1
    v = 1 - abs(x);
else
    v = 0;
end

end