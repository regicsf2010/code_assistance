function [far] = friedmanalignedstatistic(n, k, r)
%FRIEDMANSTATISTIC Summary of this function goes here
%   INPUT:
%    n: number of problems 
%    k: number of algorithms
%    r: aligned ranks

%   OUTPUT:
%    far: Friedman aligned ranks statistic
    
    tra = sum(r); % total rank of algorithms (sum of each column)
    trp = sum(r, 2); % total rank of problems (sum of each line)
    kn = k * n;
    far = (k - 1) * (sum(tra.^2) - (kn * n / 4) * (kn + 1)^2) / ( (2 * kn^3 + 3 * kn^2 + kn) / 6 - sum(trp.^2) / k );    
end