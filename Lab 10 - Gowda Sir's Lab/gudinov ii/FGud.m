function v = FGud(a,b)
% v = max(f(max(a,0)),f(min(b,0)));   % convex
 v = min(f(min(a,1/2)),f(max(b,1/2)));   % concave
end