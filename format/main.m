clear, close, clc
load 'data'

[n, d] = size(data);
[~, sd_idx] = sort(data, 2);
rank = repmat(1 : d, n, 1);

for i = 1 : n
    rank(i, sd_idx(i, :)) = 1:d;
end

rank2 = rank(1:3:end, :);
rank10 = rank(2:3:end, :);
rank30 = rank(3:3:end, :);
rank2_10 = [rank2; rank10];
rank2_30 = [rank2; rank30];
rank10_30 = [rank10; rank30];

disp(['Full rank: ' num2str(sum(rank))])
disp(['Rank2: ' num2str(sum(rank2))])
disp(['Rank10: ' num2str(sum(rank10))])
disp(['Rank30: ' num2str(sum(rank30))])

disp(['Rank2_10: ' num2str(sum(rank2_10))])
disp(['Rank2_30: ' num2str(sum(rank2_30))])
disp(['Rank10_30: ' num2str(sum(rank10_30))])

