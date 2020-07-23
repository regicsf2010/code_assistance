close, clear, clc

% Toy example for adjust the p-value from Friedman hypothesis test.
% This is for understanding purposes only.
% WARNING:
%   In this adjusted procedure, the script is supposed to receive the
%   set of p-values from NxN family of hypotheses.
%   
%   THE MATRIX CAN BE SYMMETRIC OR UPPER TRIANGULAR MATRIX.
%
% E.G.: let k be the number of algorithms. Thus this script is supposed to 
%       receive k^2 p-values to be adjusted.


% Author: Reginaldo Santos
% Date: 2018-11-17


%% Load data
load('post.mat')
data = post;
%% Call hypothesis test
ap_neme = nemenyi(data);
ap_holm = holmNxN(data);
ap_shaf = shafferNxN(data);

%% Print results
disp('Adjsuted p-values:')
fprintf('Nemenyi:\n')
disp(ap_neme)

fprintf('\nHolm:\n')
disp(ap_holm)

fprintf('\nShaffer:\n')
disp(ap_shaf)

fprintf('\n')