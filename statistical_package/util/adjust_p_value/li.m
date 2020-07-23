function [ap] = li(p)
    ap = p ./ (p + 1 - p(end));
end

