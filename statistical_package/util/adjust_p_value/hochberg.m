function [ap] = hochberg(p)
    [p, idx] = sort(p);
    
    lp = length(p);
    k = lp + 1;
    ap = zeros(1, lp);   
    
    for i =  lp : -1 : 1 
       d = k - (lp : -1 : i);
       aux = d .* p(lp : -1 : i);
       ap(i) = min(aux);
    end
    ap(idx) = ap;
end
