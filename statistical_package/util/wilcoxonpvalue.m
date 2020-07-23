function [p] = wilcoxonpvalue(T, n, r)
%WILCOXONPVALUE Perform p-value with two-tailed
%   INPUTS:
%   T: test statistic
%   n: number of differences 
%   r: ranks used to correct the standard deviation if ties are found
%
%   OUTPUT:
%   p: p-value from two-tailed test
%
%   Author: Reginaldo Santos
%   Date: 2018-06-06
    
    t = countties(r); % count size of each tie
    st = sum(t.^3 - t); % correction for ties
    z = (T - n * (n+1) / 4) / sqrt( (n * (n + 1) * (2 * n + 1) - st / 2) / 24);
	p = 2 * normcdf(-abs(z), 0, 1);
end
