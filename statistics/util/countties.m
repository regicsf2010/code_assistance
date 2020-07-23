function t = countties(r)
    n = length(r);    
    r = sort(r);    
    i =  1; % iteration countsum
    s = 1; % size of an specific tie_i
    idx = 1; % index of t vector
    t = zeros(1, n); % t will be 0 if no repetitions were found
    while (i < n)        
        if(r(i) == r(i+1))
            s = s + 1;
        else
            if(s ~= 1)
                t(idx) = s;
                idx = idx + 1;
                s = 1;
            end
        end
        i = i + 1;
        if (i == n) && (s ~= 1)
            t(idx) = s;
        end
    end
    t(t == 0) = [];
end