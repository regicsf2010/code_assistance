close, clear, clc

% Toy example for Wilcoxon hypothesis test.
% This is for understanding purposes only.
%
% Author: Reginaldo Santos
% Date: 2018-11-15

%% Load data
load('tablesFromPaper/table1')

%% Set parameters
a = .05; % alpha value (significance level)

%% Call hypothesis test
[Tpos, Tneg, p, h, cv, ranks] = wilcoxonsignedranks(data(:, end), data(:, 8), a);

%% Print results
disp(['R+: ' num2str(Tpos)])
disp(['R-: ' num2str(Tneg)])
disp(['p: ' num2str(p)])
disp(['h: ' num2str(h)])
disp(['cv: ' num2str(cv)])