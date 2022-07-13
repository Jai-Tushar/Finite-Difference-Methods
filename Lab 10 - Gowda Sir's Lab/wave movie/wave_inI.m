function w = wave_inI(t,x)

if abs(x-t) <= 1
    w = 0.5*exp(1)*(exp(-1/(1-abs(x+t)^2))+exp(-1/(1-abs(x-t)^2)));
else 
    w = 0;
end

end