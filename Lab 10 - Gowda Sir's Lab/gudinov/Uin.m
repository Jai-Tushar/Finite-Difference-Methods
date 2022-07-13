function y = Uin(x)

if x<0
    y = 1;
elseif x>=0 && x<=1
    y = 1-x;
else
    y=0;
end
