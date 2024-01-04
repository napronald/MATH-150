clear all; clc; close all;
% Generate some example data
t = linspace(0, 10, 100);
C0 = 1.0;
N0 = 0.1;
alpha = 0.5;
Beta = 0.2;
Gamma = 0.1;
Delta = 0.05;
K = 1.0;
Ctrue = C0 * exp(-Beta*t) + (alpha/Beta)*(1 - exp(-Beta*t)) + (Delta*N0/((Gamma*Delta/K) - 1))*(1 - exp(-Gamma*t));
Ntrue = (Gamma*K*N0)/(N0 + (K - N0)*exp(-Gamma*t));
C = Ctrue + randn(size(Ctrue))*0.1;
N = Ntrue + randn(size(Ntrue))*0.1;

% Define the model function
modelFun = @(params) ode45(@(t, y) [params(1) - params(2)*y(1) + params(3)*y(2)*y(1); params(4)*y(2)*(1 - (y(2)/params(5))) - params(3)*y(2)*y(1)], t, [C0; N0]);

% Define the objective function for the nonlinear least squares regression
objectiveFun = @(params) sum(sum((C - modelFun(params).y(1,:)).^2 + (N - modelFun(params).y(2,:)).^2));

% Set initial parameter guesses and bounds
params0 = [0.5, 0.2, 0.1, 0.05, 1.0];
lb = [-Inf, 0, 0, 0, 0];
ub = [Inf, Inf, Inf, Inf, Inf];

% Perform the nonlinear least squares regression
params = fmincon(objectiveFun, params0, [], [], [], [], lb, ub);

% Extract the fitted values of C and N
Cfit = modelFun(params).y(1,:);
Nfit = modelFun(params).y(2,:);
