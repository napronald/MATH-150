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
clc; clear all;
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
format short
pvec1 = [p1;p2;p3]


%% Method 2
clear all; clc;

T = [ 0   0   1/2
      1/2 1/3 0
      1/2 2/3 1/2]

lamb1 = 1/2;
lamb2 = 1/3;
lamb3 = 1/4;

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

b = [0;0;0;1]
A(4,:) = 1;
mat = A
format rational
pvec2 = A\b

format short
pvec2 = A\b


%% lecture example
clear all; clc;

T = [ 0 1/2 3/4; 1/3 0 1/4; 2/3 1/2 0]

lamb1 = 1;
lamb2 = 1/2;
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
A
format rational
pvec2 = A\b

format short
pvec2 = A\b

format long
A*pvec2

A
x=[212/813;243/883;512/883]

% A*x

%%
T = [ 0 1/2 3/4; 1/3 0 1/4; 2/3 1/2 0]

lamb1 = 1;
lamb2 = 1/2;
lamb3 = 1/3;

Pi = [0.396;0.227; 0.3777];


