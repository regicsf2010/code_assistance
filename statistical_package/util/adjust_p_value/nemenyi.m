function [ap] = nemenyi(p)
    k = length(p);
    m = k * (k - 1) / 2;     
    ap = min(m * p, 1);
    
    ap(tril(true(k))) = 0; % convert to upper triangular matrix
end

