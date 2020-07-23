function [ap] = holland(p)
    [p, idx] = sort(p);
    
    ap = zeros(1, length(p));
    k = length(p) + 1;
    
    for i = 1 : length(p)
       d = k - (1 : i);
       aux = 1 - (1 - p(1 : i)).^(d);
       ap(i) = min(max(aux), 1);
    end
    ap(idx) = ap;
end
