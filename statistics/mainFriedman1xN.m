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
%% Call hypothesis test
    post = friedmanposthoc(avgs, n, k);
    disp('Post-hoc procedure: ')
    fprintf('%.4e %.4e %.4e %.4e %.4e %.4e %.4e %.4e\n', triu(post, 1)') 
    
    % taking the algorithm under consideration and excluding itself
    alg = post(end, 1:end-1);
    
    ap_bonf = bonferroni_dunn(alg);
    ap_holm = holm1xN(alg);
    ap_hoch = hochberg(alg);
    ap_homm = hommel(alg);
    ap_holl = holland(alg);
    ap_finn = finner(alg);
    ap_li   = li(alg);

    %% Print results
    disp('Adjsuted p-values:')
    fprintf('Bonferroni-Dunn: ')
    fprintf('%.4e ', ap_bonf)

    fprintf('\nHolm           : ')
    fprintf('%.4e ', ap_holm)

    fprintf('\nHockberb       : ')
    fprintf('%.4e ', ap_hoch)

    fprintf('\nHommel         : ')
    fprintf('%.4e ', ap_homm)

    fprintf('\nHolland        : ')
    fprintf('%.4e ', ap_holl)

    fprintf('\nFinner         : ')
    fprintf('%.4e ', ap_finn)

    fprintf('\nLi             : ')
    fprintf('%.4e ', ap_li)

    fprintf('\n')
 
end