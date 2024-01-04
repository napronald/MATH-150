clear all; clc; close all;
% Beta -> Decay Rate of CO2 emissions
% Delta -> Net Growth/Decay of CO2 emissions 
% Gamma -> Intrinsic growth rate of human population
% K -> Carrying Capacity of human population
% Alpha -> Growth Rate of CO2 emissions

% Parameters
Beta = -0.006;
Delta = 1e-6;
Gamma = 0.032; 
K = 10;
alpha = 0.32; 

% %Initial guesses
% Beta = -0.01;
% Delta = 0.057;
% Gamma = 0.021; 
% K = 10;
% alpha = 0.01; 

% guesses
alpha = 0.3238; 
Beta = 0.017;
Delta = 1.58e-5;
Gamma = 0.0327; 
K = 10;
Eta = 0.0104;



% Initial conditions
C0 = 9.42;
N0 = 3.03;

% System of differential equations
dCdT = @(t, C, N) alpha + Beta*C + Delta*N*C - Eta*C;
% dCdT = @(t, C, N) alpha - Beta*C + Delta*N*C;
dNdT = @(t, C, N) Gamma*N*(1 - (N/K)) - Delta*N*C;
odes = @(t, Y) [dCdT(t, Y(1), Y(2)); dNdT(t, Y(1), Y(2))];

% Solver
time = linspace(1960,2014,55);
[T, Y] = ode45(odes, time, [C0, N0]);

% Real Data
data = readtable('dataset.csv');
year = data.Year;
% emissions = (3.6667*data.Emissions)/1000;
emissions = data.Emissions;
population = data.Population;

% Plot
subplot(2,1,1)
plot(year,emissions,'ro')
hold on
plot(T, Y(:,1), 'bo')
xlabel('Time')
ylabel('Concentration')
legend('Real Data','Our Model')
title('Concentration over time')


subplot(2,1,2)
plot(year, population,'ro');
hold on
plot(T, Y(:,2), 'bo')
xlabel('Time')
ylabel('Population')
legend('Real Data','Our Model')
title('Population over time')

rel_error_C = norm(Y(:,1)-emissions,2) / norm(emissions,2)
rel_error_N = norm(Y(:,2)-population,2) / norm(population,2)