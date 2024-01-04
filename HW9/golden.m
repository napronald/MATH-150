clear all; clc;
f = @(x) x^2 - 7*x + 12;

a = 2;
b = 4;
tol = 0.3;

r = 0.618;
x1 = a + (1-r)*(b-a);
x2 = a + r*(b-a);
while abs(b-a) > tol
    if f(x2) > f(x1)
        a = x1;
        x1 = x2;
        x2 = a + r*(b-a);
    else
        b = x2;
        x2 = x1;
        x1 = a + (1-r)*(b-a);
    end
end

golden_max = (a+b)/2