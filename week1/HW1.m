clc
clear all
close all

df = csvread("C:\Users\ronal\Downloads\S23-Math150-HW01-Data.csv",1,0);

t = zeros(1,200);
x_obs = zeros(1,200);
x_pred = zeros(1,200);

for i=1:length(df)
    t(i) = df(i,1);
    x_obs(i) = df(i,2);
    x_pred(i) = df(i,3);
end

% t
% x_obs
% x_pred

subplot(3,1,1)
hold on
plot(t,x_obs,'b-',t,x_pred,'r-');
xlabel('t');
ylabel('x(t)')
titletxt = sprintf('Observations and Predictions');
title(titletxt)
legend('Observed Points','Predicted points')

subplot(3,1,2)
plot(t,abs(x_obs-x_pred),'.-',t,abs((x_pred-x_obs)./(x_obs)),'.r-');
xlabel('t')
ylabel('Error')
title('Absolute Error and Relative Error')
legend('Absolute Error','Relative Error')

abs_1norm = norm(abs(x_obs-x_pred),1);
abs_2norm = norm(abs(x_obs-x_pred),2);
abs_infnorm = norm(abs(x_obs-x_pred),inf);

rel_1norm = norm(abs((x_pred-x_obs)./(x_obs)),1);
rel_2norm = norm(abs((x_pred-x_obs)./(x_obs)),2);
rel_infnorm = norm(abs((x_pred-x_obs)./(x_obs)),inf);

subplot(3,2,5)
plot(abs_1norm,0,'.',abs_2norm,0,'r.',abs_infnorm,0,'g.','MarkerSize', 30);
ylabel('Norm')
title('Absolute Error Norms')
legend('Absolute Error 1-norm','Absolute Error 2-norm','Absolute Error inf-norm')

subplot(3,2,6)
plot(rel_1norm,0,'.',rel_2norm,0,'r.',rel_infnorm,0,'g.','MarkerSize', 30);
ylabel('Norm')
title('Relative Error Norms')
legend('Relative Error 1-norm','Relative Error 2-norm','Relative Error inf-norm')


