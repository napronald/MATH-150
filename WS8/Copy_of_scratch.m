clear all; clc; close all;

% nplot = linspace(501,600,100);
% 
% subplot(2,2,1)
% a = 5;
% xn = ricker_iterate_600(x0, a);
% plot(nplot,xn','o-')
% title('Subplot 1: x(n) vs n, a=5')
% 
% subplot(2,2,2)
% a = 8;
% xn = ricker_iterate_600(x0, a);
% plot(nplot,xn','o-')
% title('Subplot 2: x(n) vs n, a=8')
% 
% subplot(2,2,3)
% a = 13;
% xn = ricker_iterate_600(x0, a);
% plot(nplot,xn','o-')
% title('Subplot 3: x(n) vs n, a=13')
% 
% subplot(2,2,4)
% a = 20;
% xn = ricker_iterate_600(x0, a);
% plot(nplot,xn','o-')
% title('Subplot 4: x(n) vs n, a=20')

x0 = 1; % initial condition
a_values = 0:20; % parameter values
n = 100; % number of iterates for each value of a

figure;
hold on;
for i = 1:length(a_values)
    xn = ricker_iterate_600(x0, a_values(i))
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