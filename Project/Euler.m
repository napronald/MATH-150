clear all; clc; close all;

% Parameters
Beta = -0.006;
Delta = 1e-6;
Gamma = 0.032; 
K = 10;
alpha = 0.32; 

% Initial conditions
C0 = 9.42;
N0 = 3.03;

% System of differential equations
dCdT = @(t, C, N) alpha - Beta*C + Delta*N*C;
dNdT = @(t, C, N) Gamma*N*(1 - (N/K)) - Delta*N*C;


dt = 1;
t = 1960:dt:2014;

C(1) = C0;
N(1) = N0;
for i = 1:length(t)-1
    C(i+1) = C(i) + dCdT(t(i), C(i), N(i))*dt;
    N(i+1) = N(i) + dNdT(t(i), C(i), N(i))*dt;
end

% Real Data
data = readtable('dataset.csv');
year = data.Year;
emissions = data.Emissions;
population = data.Population;

% Plot
subplot(2,1,1)
plot(year,emissions,'ro')
hold on
plot(t, C, 'bo')
xlabel('Time')
ylabel('Concentration')
legend('Real Data','Our Model')
title('Concentration over time')


subplot(2,1,2)
plot(year, population,'ro');
hold on
plot(t, N, 'bo')
xlabel('Time')
ylabel('Population')
legend('Real Data','Our Model')
title('Population over time')

rel_error_C = norm(C-emissions,2) / norm(emissions,2)
rel_error_N = norm(N-population,2) / norm(population,2)