function [pc] = hommel(p)
    k = length(p);
    
    % Sort p-values from smallest to largest
    [pc, pidx] = sort(p);
    
    % Get indexes of p-value indexes
    [~, ipidx] = sort(pidx);
    
    % Generate vectors for cycle
    pa = repmat(min(k * pc ./ (1:k)), size(p));
    q = pa;
    
    % Begin cycle
    for i = (k - 1) : -1 : 2
        i1 = 1 : (k - i + 1);
        i2 = (k - i + 2) : k;
        q1 = min(i * pc(i2) ./ (2:i));
        q(i1) = min(i * pc(i1), q1);
        q(i2) = q(k - i + 1);
        pa = max(pa, q);
    end
    
    % Finalize result
    pa = max(pa, pc);
    pc = pa(ipidx);
end

