clear, close, clc

load 'ranks.mat'

r10 = sum(ranks(1:3:end, :));
r30 = sum(ranks(2:3:end, :));
r50 = sum(ranks(3:3:end, :));

r10_30 = r10 + r30;
r10_50 = r10 + r50;
r30_50 = r30 + r50;
r10_30_50 = r10 + r30 + r50;

disp(r10)
disp(r30)
disp(r50)
disp(r10_30)
disp(r10_50)
disp(r30_50)
disp(r10_30_50)

avg_ranks = mean(ranks);
[val, p] = sort(avg_ranks);
names = {'ARPSO', 'GPSO', 'DGHPSOGS', 'SPSO', 'WPSO', 'BPSO', 'SAPSO', 'RI-SAPSO'};
disp(mean(ranks))
disp(val)