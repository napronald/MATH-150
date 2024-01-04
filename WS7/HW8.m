clear all; clc;
% Question #1

% Transition Matrix for SIR model
T = [0.9 0 0.3
     0.1 0.7 0
     0   0.3 0.7];

% Initial starting state
x0 = [0.6; 0.3; 0.1]; 

num_days = 75; % Given number of days

T75 = T^num_days;

T75*x0

%% Question #2

% format rational for fraction
% format short for demical

% Method 1
pi = [535/2006; 1/5; 1065/1997];   

lambda1 = 2;
lambda2 = 3;
lambda3 = 4;

num1 = pi(1) / lambda1;
num2 = pi(2) / lambda2;
num3 = pi(3) / lambda3; 

denom = (pi(1)/lambda1) + (pi(2)/lambda2) + (pi(3)/lambda3);

p1 = num1 / denom;
p2 = num2 / denom;
p3 = num3 / denom;

format rational
% format short
pvec1 = [p1;p2;p3]


%% Method 2
T = [ 0   0   1/2
      1/2 1/3 0
      1/2 2/3 0];

lamb1 = 1/2;
lamb2 = 1/3;
lamb3 = 1/4;

A = zeros(4,3);
A(1,1) = -1/2;
A(2,2) = -1/3;
A(3,3) = -1/4;

A(1,2) = T(4)*lamb1;
A(1,3) = T(7)*lamb1;

A(2,1) = T(2)*lamb2;
A(2,3) = T(8)*lamb2;

A(3,1) = T(3)*lamb3;
A(3,2) = T(6)*lamb3;

b = [0;0;0;1];
A(4,:) = 1;
A
% format rational
format short
pvec2 = A\b
