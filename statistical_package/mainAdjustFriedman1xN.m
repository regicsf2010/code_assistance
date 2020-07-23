close, clear, clc

% Toy example for adjust the p-value from Friedman hypothesis test.
% This is for understanding purposes only.
% WARNING:
%   In this adjusted procedure, the script is supposed to receive the
%   set of p-values from 1xN family of hypotheses, EXCLUDING THE 
%   CONTROL METHOD. 
%   
%   DO NOT FORGET THIS TIP! THE SET OF ADJUSTED METHODS IS BASED ON
%   THE NUMBER (k - 1). DO NOT CONSIDER THE P-VALUE OF THE ALGORITHM j
%   COMPARED WITH ITSELF! 
%
%   THUS, WORKING WITH k P-VALUES WILL LEAD TO MISADJUSTED P-VALUES!
%
% E.G.: let k be the number of algorithms. Thus this script is supposed to 
%       receive (k - 1) p-values to be adjusted.

% Author: Reginaldo Santos
% Date: 2018-11-15


%% Load data
load('tablesFromPaper/table16')

%% Call hypothesis test
ap_bonf = bonferroni_dunn(data);
ap_holm = holm1xN(data);
ap_hoch = hochberg(data);
ap_homm = hommel(data);
ap_holl = holland(data);
ap_finn = finner(data);
ap_li   = li(data);

%% Print results
disp('Adjsuted p-values:')
fprintf('Bonferroni-Dunn: ')
fprintf('%.8f ', ap_bonf)

fprintf('\nHolm           : ')
fprintf('%.8f ', ap_holm)

fprintf('\nHockberb       : ')
fprintf('%.8f ', ap_hoch)

fprintf('\nHommel         : ')
fprintf('%.8f ', ap_homm)

fprintf('\nHolland        : ')
fprintf('%.8f ', ap_holl)

fprintf('\nFinner         : ')
fprintf('%.8f ', ap_finn)

fprintf('\nLi             : ')
fprintf('%.8f ', ap_li)

fprintf('\n')
