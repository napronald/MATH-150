clear all; clc;

f = @(x) x^2 - 7*x + 12;

a = 2;
b = 4;
tol = 0.3;

while abs(b-a) > tol
    x = (a+b)/2;
    x1 = x - tol;
    x2 = x + tol;
    if f(x2) > f(x1)
        a = x;
    else
        b = x;
    end
end

dicho_max = (a+b)/2