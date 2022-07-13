function w = wave_in(x)

if abs(x) <= 1
    w = 1 - abs(x);
else
    w = 0;
end

end