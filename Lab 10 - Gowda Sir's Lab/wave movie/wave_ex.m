% Something wrong in this code. DO NOT RUN in Main Program. Instead 
% use mu = 1 for for exact solution

function w = wave_ex(t,x)

if abs(x-t) <= 1
    w = 0.5*((1-abs(x+t))+(1-abs(x-t)));
else
    w = 0;
end

end