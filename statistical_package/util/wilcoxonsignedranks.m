function [Tpos, Tneg, p, h, cv, ranks] = wilcoxonsignedranks(x, y, alpha)
%WILCOXONSIGNEDRANKS Wilcoxon Signed-Ranks test
%   INPUTS:
%   x: samples from population one
%   y: samples from population two
%
%   OUTPUTS:
%   Tpos: sum of ranks where the first algorithm outperformed the
%   sencond
%   Tneg: sum of ranks where the second algorithm outperformed the first
%   p: p-value
%   h:
%       1 -> reject H0
%       0 -> do not reject H0
%   cv: critical value from the Wilcoxon T Distribution Table according to
%   the two-tailed and alpha value
%
%   Author: Reginaldo Santos
%   Date: 2018-06-05

    if(nargin == 2)
        alpha = 0.05;
    end
    
%% Perform differences between samples
    dxy = y - x;
    
%% One way to deal with zero differences: ignore all of them
% This method is based on the book: Biostatiscal Analysis
%     dxy(dxy == 0) = []; % Differences of zero are ignored in this test
%     if(isempty(dxy)) % p-value is one and H0 is not rejected
%         p = 1;
%         h = 0;
%         return
%     end
    
%% Another way to deal with zero differences: divide the ranks evenly
    idxeq = find(dxy == 0);
    if(mod(length(idxeq), 2) == 1)
        idxeq(end) = [];
    end
    
%% Perform rank calculus
    ranks = fracrank(abs(dxy));

%% Perform Tplus sign (T positive)   
    idpos = dxy > 0;
    Tpos = sum(ranks(idpos)) + sum(ranks(idxeq)) / 2;

%% Perform Tplus sign (T negative)
    idneg = dxy < 0;
    Tneg = sum(ranks(idneg)) + sum(ranks(idxeq)) / 2;

%% Perform test statistic    
    T = min(Tpos, Tneg);

%% Perform p-value and handle H0
    n = length(dxy);
    p = wilcoxonpvalue(T, n, ranks); % p-value
    
    if (n <= 50)
        cv = wilcoxoncvalue(n, alpha); % two-tailed test from Wilcoxon distribution
        h = T <= cv; % reject or not H0 based on Wilcoxon table
    else
        cv = inf; % no critical value for n>50 defined in internal table
        h = p <= alpha; % reject or not H0 based on p-value
    end
    
    
end

