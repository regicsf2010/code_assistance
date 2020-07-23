function [ap] = bonferroni_dunn(p)    
    v = length(p) * p;
    ap = arrayfun(@(i) min(v(i), 1), 1 : length(v));
end

