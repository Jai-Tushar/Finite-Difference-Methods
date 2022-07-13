function z=ex_wave(t,x)

if x<-1+t
    z=0;
elseif x>=(-1+t) && x<=t
    z=1+x-t;
elseif x>t && x<=(1+t)
    z=1-x+t;
else
    z=0;
end
end
