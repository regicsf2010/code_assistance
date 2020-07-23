close, clear, clc

% Toy example for Friedman hypothesis test.
% This is for understanding purposes only.
%
% Author: Reginaldo Santos
% Date: 2018-11-15

%% Load data
load('data')

%% Set parameters
a = .05; % alpha value (significance level)

%% Call hypothesis test
[fs, fids, p, h, cv, ~, avgs] = friedmanranks(data, a);

%% Print results
disp(['Friedman statistic: ' num2str(fs)])
disp(['Iman and Davenport statistic: ' num2str(fids)])
disp(['p: ' num2str(p)])
disp(['h: ' num2str(h)])
disp(['cv: ' num2str(cv)])
disp(['avgs: ' num2str(avgs)])

%% Post-hoc procedure
if(p <= a)
    [post, z] = friedmanposthoc(avgs, size(data, 1), size(data, 2));
    disp('Post-hoc procedure: ')
    disp(triu(post) - eye(size(data, 2)))
    save post.mat post
end


