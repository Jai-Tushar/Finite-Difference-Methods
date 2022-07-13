function z = uinit(x)

if x<=-1 
    z = 0;
elseif x>-1 && x<=0
    z =1+x;
elseif x>0 && x<1
    z =1-x;
elseif x>=1
    z = 0;
end

