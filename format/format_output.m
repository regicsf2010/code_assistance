clear, close, clc


%% Load each average error for each algorithms' result
% format long e
% n = 29 * 3;
% output = zeros(n, 1);
% load '10avg_err.mat'
% output(1 : 3 : n, 1) = avg_err;
% 
% load '30avg_err.mat'
% output(2 : 3 : n, 1) = avg_err;
% 
% load '50avg_err.mat'
% output(3 : 3 : n, 1) = avg_err;

%% Load each average time for each algorithms' result
% format
% load '10avg_time.mat'
% disp(mean(avg_time))
% 
% load '30avg_time.mat'
% disp(mean(avg_time))
% 
% load '50avg_time.mat'
% disp(mean(avg_time))

%% Load each average sucess rate for each algorithms' result
format
load '10avg_sr.mat'
disp(mean(avg_sr))

load '30avg_sr.mat'
disp(mean(avg_sr))

load '50avg_sr.mat'
disp(mean(avg_sr))

