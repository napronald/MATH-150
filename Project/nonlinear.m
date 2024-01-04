% clear all
% clc
% close all
% 
% % Actual Data Points
% data = readtable('dataset.csv');
% x = data.Year;
% y = data.Emissions;
% name = "Emissions";
% approx(x,y,name)
% 
% 
% y = data.Population;
% name = "Population";
% approx(x,y,name)
% 
% 
% function approx(x,y,name)
% figure
% plot(x,y,'o')
% 
% % Parameters
% terms = 3;
% num_pts = length(x);
% 
% % formulate A matrix based on # of terms
% A = ones(length(x),terms);
% for j=1:terms-1
%     A(:,j+1) = A(:,j).*x;
% end
% 
% % Apply normal equations
% M = A'*A;
% b = A'*y;
% coefs = M\b
% 
% r = y - A*coefs;
% magnitude = norm(r,inf)
% 
% p = @(x) coefs(1) + coefs(2)*x + coefs(3)*x^2;
% 
% x = linspace(min(x),max(x),num_pts);
% for i=1:length(x)
%     y_approx(i) = p(x(i));
% end
% 
% hold on 
% plot(x,y_approx,'r.-','MarkerSize',8)
% xlabel('time')
% ylabel(name)
% legend('Actual Points','Approximation Points')
% title(name)
% end

%%
clc; clear all;

rng(100); % set the seed for random number generation
T = 1; 
N = 500; 
dt = T/N;
dW = zeros(1,N); % preallocate arrays ...
W = zeros(1,N); % for efficiency
dW(1) = sqrt(dt)*randn; % first approximation outside the loop ...
W(1) = dW(1); % since W(0) = 0 is not allowed
for j = 2:N
    dW(j) = sqrt(dt)*randn; % general increment
    W(j) = W(j-1) + dW(j);
end

plot([0:dt:T], [0,W], 'r-') % plot W against t
xlabel('t', 'FontSize', 16)
ylabel('W(t)', 'FontSize', 16, 'Rotation', 0)
