clear all; clc; close all;
% Import required packages
% import scipy.integrate as spi
% import scipy.optimize as spo
% import scipy.interpolate as spi

% Define data
data = [1960, 2569, 3.03;        1961, 2580, 3.07;        1962, 2686, 3.12;        1963, 2833, 3.19;        1964, 2995, 3.26;        1965, 3130, 3.32;        1966, 3288, 3.39;        1967, 3393, 3.46;        1968, 3566, 3.53;        1969, 3780, 3.61;        1970, 4053, 3.68;        1971, 4208, 3.76;        1972, 4376, 3.84];
    
data(:, 2) = data(:, 2) * 3.667 / 1000;
t_data = data(:, 1);
y_data = data(:, 2:3);

% Guesses for alpha, beta, delta, gamma, K
parameters = [0.01, -0.01, 0.057, 0.021, 10];

t = linspace(t_data(1), t_data(end), 55);
y_interp = zeros(length(t), size(y_data, 2));
for i = 2:3
    f = interp1(t_data, y_data(:, i-1), 'spline');
    y_interp(:, i-1) = f(t);
end

% Define bounds for parameters
lb = [0, -1, 0, 0.01, 5];
ub = [1, 0, 0.1, 0.05, 10];
bound = [lb; ub];

% Optimize the parameters using least squares
res = spo.lsqnonlin(@(params)objective(params, t, y_interp), parameters, lb, ub);

fprintf("alpha = %f\n",res(1));
fprintf("beta = %f\n",res(2));
fprintf("delta = %f\n",res(3));
fprintf("gamma = %f\n",res(4));
fprintf("K = %f\n",res(5));

y0 = y_interp(1, :).';
sol = spi.ode45(@(t, y)model(t, y, res(1), res(2), res(3), res(4), res(5)), t, y0);

function dydt = model(t, y, alpha, beta, delta, gamma, K)
    C = y(1);
    N = y(2);
    dCdT = alpha - beta*C + delta*N*C;
    dNdT = gamma*N*(1 - N/K) - delta*N*C;
    dydt = [dCdT; dNdT];
end

% Define objective function
function error = objective(params, t, y)
    y0 = [y(1,1); y(1,2)];
    sol = spi.ode45(@(t, y)model(t, y, params(1), params(2), params(3), params(4), params(5)), t, y0);
    error = (y - deval(sol, t)).';
end
