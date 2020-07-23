function [cv] = wilcoxoncvalue(n, alpha)
%WILCOXONCVALUE Critical value for Wilcoxon Signed-Ranks test
%   INPUTS:
%   n: number of samples
%   alpha: alpha value
%   tail: this version use default 'two-tailed'
%
%   OUTPUTS:
%   cv: critical value
%
%   Author: Reginaldo Santos
%   Date: 2018-06-05
    
    cv_0_01 = [nan nan nan nan nan nan nan 0 1 3 ...
               5 7 9 12 15 19 23 27 32 37 42 48 54 ...
               61 68 75 83 91 100 109 118 128 138 ...
               148 159 171 182 194 207 220 233 247 ...
               261 276 291 307 322 339 355 373]';
    cv_0_05 = [nan nan nan nan nan 0 2 3 5 8 ...
               10 13 17 21 25 29 34 40 46 52 ...
               58 65 73 81 89 98 107 116 126 137 ...
               147 159 170 182 195 208 221 235 249 264 ...
               279 294 310 327 343 361 378 396 415 434]';       
    cv_0_10 = [nan nan nan nan 0 2 3 5 8 10 ...
               13 17 21 25 30 35 41 47 53 60 ...
               67 75 83 91 100 110 119 130 140 151 ...
               163 175 187 200 213 227 241 256 271 286 ...
               302 319 336 353 371 389 407 426 446 466]';
    
    % Table with maximum of 50 (n = 50) pair-test
    table = [cv_0_01 cv_0_05 cv_0_10];
    switch(alpha)
        case 0.01
            id = 1;
        case 0.05
            id = 2;
        case 0.1
            id = 3;
        otherwise
            id = 2; % alpha = 0.05 by default
    end
    cv = table(n, id);        
end

