close, clear, clc

%% Load data
load('data.mat')

[n, k] = size(data);

%% Perform Friedman test
a = .05;
[fs, fids, p, h, cv, ~, avgs] = friedmanranks(data, a);

%% Print results
disp(['Friedman statistic: ' num2str(fs)])
disp(['Iman and Davenport statistic: ' num2str(fids)])
disp(['p: ' num2str(p)])
disp(['h: ' num2str(h)])
disp(['cv: ' num2str(cv)])

%% Post-hoc procedure
if(p <= a)
    post = friedmanposthoc(avgs, n, k);
    disp('Post-hoc procedure: ')
    fprintf('%.4f %.4f %.4f %.4f %.4f %.4f %.4f %.4f\n', triu(post, 1)') 
    
%% Call hypothesis test
    ap_neme = nemenyi(post);
    ap_holm = holmNxN(post);
    ap_shaf = shafferNxN(post);

%% Print results
    fprintf('\nAdjsuted p-values:\n')
    fprintf('Nemenyi:\n')
    fprintf('%.4f %.4f %.4f %.4f %.4f %.4f %.4f %.4f\n', ap_neme')

    fprintf('\nHolm:\n')
    fprintf('%.4f %.4f %.4f %.4f %.4f %.4f %.4f %.4f\n', ap_holm')

    fprintf('\nShaffer:\n')
    fprintf('%.4f %.4f %.4f %.4f %.4f %.4f %.4f %.4f\n', ap_shaf')

    fprintf('\n')    
end