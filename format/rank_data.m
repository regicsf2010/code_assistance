clear, close, clc

load 'data.mat'

ranks = zeros(size(data));
vals = 1 : size(data, 2);
for i = 1 : size(data, 1)
    [~, ranks(i, :)] = sort(data(i, :), 'ascend');
    ranks(i, ranks(i, :)) = vals;
end

disp(ranks)
save ranks.mat ranks