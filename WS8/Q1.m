clc; clear all;

% Method 1
T = [0 0 1/2; 1 0 1/2; 0 1 0];

pi = T^10000;

lambda1 = 2;
lambda2 = 1;
lambda3 = 1/3;

num1 = pi(1) / lambda1;
num2 = pi(2) / lambda2;
num3 = pi(3) / lambda3; 

denom = (pi(1)/lambda1) + (pi(2)/lambda2) + (pi(3)/lambda3);

p1 = num1 / denom;
p2 = num2 / denom;
p3 = num3 / denom;

format rational
pvec1 = [p1;p2;p3]

format short
pvec1 = [p1;p2;p3]


%% Method 2

T = [0 0 1/2; 1 0 1/2; 0 1 0];

lamb1 = 2;
lamb2 = 1;
lamb3 = 1/3;

A = zeros(4,3);
A(1,1) = -lamb1;
A(2,2) = -lamb2;
A(3,3) = -lamb3;

A(1,2) = T(4)*lamb2;
A(1,3) = T(7)*lamb3;

A(2,1) = T(2)*lamb1;
A(2,3) = T(8)*lamb3;

A(3,1) = T(3)*lamb1;
A(3,2) = T(6)*lamb2;

b = [0;0;0;1];
A(4,:) = 1;
mat = A
format rational
pvec2 = A\b

format short
pvec2 = A\b

