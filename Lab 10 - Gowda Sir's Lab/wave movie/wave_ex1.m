function w = wave_ex1(t,x)

if abs(x-t) <= 1
    w = 1 - abs(x-t);
else
    w = 0;
end

end