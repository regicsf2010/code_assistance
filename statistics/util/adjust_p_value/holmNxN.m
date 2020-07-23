function [ap] = holmNxN(p)
    k = length(p);
    m = k * (k - 1) / 2 : -1 : 1;
    
    vp = p(triu(true(k), 1)); % convert upper triangular into a vector
    [pi, idx] = sort(vp); 
    ap_aux = zeros(1, m(1));
    
    for j = 1 : m(1)
        d = m(1 : j);
        aux = d .* pi(1 : j)';
        ap_aux(j) = min(max(aux), 1);
    end
    
    ap_aux(idx') = ap_aux;
    
    ap = triu(ones(k), 1); 
    ap(ap > 0) = ap_aux; % convert a vector to upper triangular    
end
