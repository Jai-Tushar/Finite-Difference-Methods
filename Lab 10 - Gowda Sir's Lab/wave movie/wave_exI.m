% Something wrong in this code. DO NOT RUN in Main Program. Instead 
% use mu = 1 for for exact solution

function w = wave_exI(x)

if abs(x) <= 1
    w = 3*exp(-1/(1-abs(x)^2));
else 
    w = 0;
end

end