clear all; clc; close all;

x0 = 1; % initial condition
a_values = 0:20; % parameter values
n = 100; % number of iterates for each value of a

figure;
hold on;
for i = 1:length(a_values)
    xn = ricker_iterate_600(x0, a_values(i));
    plot(a_values(i) * ones(n, 1), xn, '.', 'MarkerSize', 30);
end
xlabel('a');
ylabel('x');
title('Feigenbaum diagram for the Ricker model');

function xn = ricker_iterate_600(x0, a)
xn = zeros(100, 1); % initialize output vector
x = x0; % set initial condition
for n = 1:600
    x = a * x * exp(-x); % iterate the Ricker model
    if n > 500 % save last 100 iterates
        xn(n-500) = x;
    end
end
end