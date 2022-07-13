function w = wave_in(x)

if abs(x) <= 1
    w = exp(-1/(1-abs(x)*abs(x)));
else
    w = 0;
end

end