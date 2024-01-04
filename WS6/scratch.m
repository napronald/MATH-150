clear all; clc;

prob = [4 3 3];
p = normalize(prob, 'norm', 1);

edges = [0, cumsum(p)];
edges(end) = 1;

x = rand(1, 100000);

D = discretize(x, edges);

histogram(D)
