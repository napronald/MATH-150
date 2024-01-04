clear all; clc; close all;

x0 = 1;
n = 20;
naxis = 1:20;

subplot(2,2,1)
a = 5;
x = ricker(x0, a, n);
plot(naxis,x','o-')
xlabel('n Iterations')
ylabel('x(n)')
title('Subplot 1: x(n) vs n, a=5')

subplot(2,2,2)
a = 8;
x = ricker(x0, a, n);
plot(naxis,x','o-')
xlabel('n Iterations')
ylabel('x(n)')
title('Subplot 2: x(n) vs n, a=8')

subplot(2,2,3)
a = 13;
x = ricker(x0, a, n);
plot(naxis,x','o-')
xlabel('n Iterations')
ylabel('x(n)')
title('Subplot 3: x(n) vs n, a=13')

subplot(2,2,4)
a = 20;
x = ricker(x0, a, n);
plot(naxis,x','o-')
xlabel('n Iterations')
ylabel('x(n)')
title('Subplot 4: x(n) vs n, a=20')

%% Feigenbaum Diagram
a = 0:20;
n = 100; 

figure(2);
hold on;
for i = 1:length(a)
    xn = ricker_600(a(i));
    plot(a(i) * ones(n, 1), xn, '.', 'MarkerSize', 30);
end
xlabel('a');
ylabel('x');
title('Feigenbaum diagram for the Ricker model');


%% functions
function x = ricker(x0, a, n)
x0 = 1;
x(1) = x0;
for i = 2:n
    x(i) = a* x(i-1) * exp(-x(i-1));
end
end

function xn = ricker_600(a)
x0 = 1;
x = x0; 
for n = 1:600
    x = a * x * exp(-x); 
    if n > 500 
        xn(n-500) = x;
    end
end
end