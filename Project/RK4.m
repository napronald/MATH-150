clear all; clc; close all;

% Parameters
Beta = 1;
Delta = 1;
Gamma = 1;
K = 1;
alpha = 0.5;

% Initial conditions
C0 = 1;
N0 = 1;

% Define the ODE system
dCdT = @(t, C, N) alpha - Beta*C + Delta*N*C;
dNdT = @(t, C, N) Gamma*N*(1 - (N/K)) - Delta*N*C;

% Define the time interval
tspan = [0 10];

% Define the step size
h = 0.1;

% Initialize the solution arrays
t = tspan(1):h:tspan(2);
C = zeros(size(t));
N = zeros(size(t));
C(1) = C0;
N(1) = N0;

% Solve the ODE system using the fourth-order Runge-Kutta method
for i = 1:length(t)-1
    k1C = h*dCdT(t(i), C(i), N(i));
    k1N = h*dNdT(t(i), C(i), N(i));
    
    k2C = h*dCdT(t(i)+h/2, C(i)+k1C/2, N(i)+k1N/2);
    k2N = h*dNdT(t(i)+h/2, C(i)+k1C/2, N(i)+k1N/2);
    
    k3C = h*dCdT(t(i)+h/2, C(i)+k2C/2, N(i)+k2N/2);
    k3N = h*dNdT(t(i)+h/2, C(i)+k2C/2, N(i)+k2N/2);
    
    k4C = h*dCdT(t(i)+h, C(i)+k3C, N(i)+k3N);
    k4N = h*dNdT(t(i)+h, C(i)+k3C, N(i)+k3N);
    
    C(i+1) = C(i) + (k1C + 2*k2C + 2*k3C + k4C)/6;
    N(i+1) = N(i) + (k1N + 2*k2N + 2*k3N + k4N)/6;
end

% Plot the solution
figure;
plot(t, C, 'r-', t, N, 'b-');
xlabel('Time');
ylabel('Concentration');
legend('C(t)', 'N(t)');