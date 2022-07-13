function v = u_exI(t,x)

 if x<=t
     v = 0;
 elseif x>=t & x<=(t+1/2)
     v = (x-t);
 elseif x>=(t+1/2) & x<=(t+1)
     v =(1-x+t);
 elseif x>=(t+1)
     v = 0;
 end

end