clear all; clc;

%% #2a
a=1
syms y,a
 
y =  ( 1+sqrt(32*a^2 + 33) ) / ( 8*(a^2 + 1) )

x = ( (2*y-(1/2) ) + sqrt(8*a^2 + ( (1/2) - 2*y)^2 ) ) / (-4*a)

%%
syms y
syms a

y =  ( 1+sqrt(32*a^2 + 33) ) / ( 8*(a^2 + 1) )

x = ( (2*y-(1/2) ) + sqrt(8*a^2 + ( (1/2) - 2*y)^2 ) ) / (-4*a)

%% Problem #2b
%For a,y(a)
a = linspace(-20,20,1000);
y = @(a) ( 1-sqrt(32*a.^2 + 33) ) / ( 8*(a.^2 + 1) );

for i=1:length(a)
    yplot(i) = y(a(i));
end
figure(1)
plot(a',yplot,'-')

a = linspace(-20,20,1000);
y = @(a) ( 1+sqrt(32*a.^2 + 33) ) / ( 8*(a.^2 + 1) );

for i=1:length(a)
    yplot(i) = y(a(i));
end
figure(2)
plot(a',yplot,'-')

%% For a,x(a)
a = linspace(-20,20,1000);
y = @(a) ( a-a*sqrt(32*a.^2 + 33) ) / ( 8*(a.^2 + 1) );

for i=1:length(a)
    yplot(i) = y(a(i));
end
figure(1)
plot(a',yplot,'-')

a = linspace(-20,20,1000);
y = @(a) ( a+a*sqrt(32*a.^2 + 33) ) / ( 8*(a.^2 + 1) );

for i=1:length(a)
    yplot(i) = y(a(i));
end
figure(2)
plot(a',yplot,'-')

%% For a,f(a)
a = linspace(-20,20,1000);
y = @(a) ( a-a*sqrt(32*a.^2 + 33) ) / ( 8*(a.^2 + 1) );

for i=1:length(a)
    yplot(i) = y(a(i));
end
figure(1)
plot(a',yplot,'-')

a = linspace(-20,20,1000);
y = @(a) ( a+a*sqrt(32*a.^2 + 33) ) / ( 8*(a.^2 + 1) );

for i=1:length(a)
    yplot(i) = y(a(i));
end
figure(2)
plot(a',yplot,'-')


%%
clear all; clc
a = linspace(-20,20,1000);

y =  ( 1-sqrt(32*a^2 + 33) ) / ( 8*(a^2 + 1) );

x = ( a-a*sqrt(32*a^2 + 33) ) / ( 8*(a^2 + 1) );

f = (a(i)*x + y - 0.25 ) * exp(-x^2-y^2)

for i=1:length(a)
    yplot(i) = f(a(i));
end
figure(2)
plot(a',yplot,'-')
