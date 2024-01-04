%% Problem #1
clear all, clc, close all

Beta = [10; 28; 8/3];
x0 = [0; 1; 20];
dt = 0.001;
tspan = dt:dt:50;

% 3D Plot 
figure('Name','Question #1 3D Plot')
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Question 1')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

% Subplots for each dimension

% plot f(t,x)
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #1 Subfigures');
ax2 = subplot(3,1,1); 
plot(ax2, t1,x1(:,1)','b')
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t1,x1(:,1)','r--')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,x)';
ax2.Title.String = '';
legend('Tolerance 1e-12','Tolerance 1e-6')
title('Plot for f(t,x)')

% plot f(t,y)
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

ax2 = subplot(3,1,2); 
plot(ax2, t1,x1(:,2)','k')
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t1,x1(:,2)','r--')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,y)';
ax2.Title.String = '';
legend('Tolerance 1e-12','Tolerance 1e-6')
title('Plot for f(t,y)')

% plot f(t,z)
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

ax2 = subplot(3,1,3); 
plot(ax2, t1,x1(:,3)','y')
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t1,x1(:,3)','r--')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,z)';
ax2.Title.String = '';
legend('Tolerance 1e-12','Tolerance 1e-6')
title('Plot for f(t,z)')


%% Problem #2 First Plot 
clear all, clc, close all

Beta = [10; 28; 8/3];
x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:1;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Plot of 1st set of ICs')
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Plot 1 For 0 < t < 1')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

% Subfigures
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 Subfigures of 1st set of ICs')
ax2 = subplot(3,1,1); 
plot(ax2, t1,x1(:,1)','-b')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,x)';
ax2.Title.String = '';
legend('x(t)')
title('Plot of f(t,x)')

% plot of f(t,y)
ax2 = subplot(3,1,2); 
plot(ax2, t1,x1(:,2)','-r')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,y)';
ax2.Title.String = '';
legend('y(t)')
title('Plot of f(t,y)')

% plot of f(t,z)
ax2 = subplot(3,1,3); 
plot(ax2, t1,x1(:,3)','-y')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,z)';
ax2.Title.String = '';
legend('z(t)')
title('Plot of f(t,z)')




%% Problem #2 Second Plot
x0 = [0.10001; 1; 20];
dt = 0.001;
tspan = 0:dt:3;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Plot of 2nd set of ICs')
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Plot 2 For 0 < t < 3')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

% Subfigures
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 Subfigures of 2nd set of ICs')
% Plot of f(t,x)
ax2 = subplot(3,1,1); 
plot(ax2, t1,x1(:,1)','b')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,x)';
ax2.Title.String = '';
legend('x(t)')
title('Plot of f(t,x)')

% plot of f(t,y)
ax2 = subplot(3,1,2); 
plot(ax2, t1,x1(:,2)','-r')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,y)';
ax2.Title.String = '';
legend('y(t)')
title('Plot of f(t,y)')

% plot of f(t,z)
ax2 = subplot(3,1,3); 
plot(ax2, t1,x1(:,3)','-y')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,z)';
ax2.Title.String = '';
legend('z(t)')
title('Plot of f(t,z)')



%%  Problem #2 Third Plot

x0 = [0.15; 1; 20];
dt = 0.001;
tspan = 0:dt:7;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Plot of 3rd set of ICs')
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Plot 3 For 0 < t < 7')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

% Subfigures
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Subfigures of 3rd set of ICs')
% plot of f(t,x)
ax2 = subplot(3,1,1); 
plot(ax2, t1,x1(:,1)','-b')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,x)';
ax2.Title.String = '';
legend('x(t)')
title('Plot of f(t,x)')

% plot of f(t,y)
ax2 = subplot(3,1,2); 
plot(ax2, t1,x1(:,2)','-r')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,y)';
ax2.Title.String = '';
legend('y(t)')
title('Plot of f(t,y)')

% plot of f(t,z)
ax2 = subplot(3,1,3); 
plot(ax2, t1,x1(:,3)','-y')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,z)';
ax2.Title.String = '';
legend('z(t)')
title('Plot of f(t,z)')



%% Problem #3
clear all, clc, close all

%  0 < sigma < 1; rho = 1; 0 < beta < 20
Beta = [0.5; 1; 10];
x0 = [0; 1; 20];
dt = 0.001;
tspan = dt:dt:50;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #3 3D Plot of changed ICs')
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Question 3')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

% Subfigures
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Subfigures of 3rd set of ICs')
% plot of f(t,x)
ax2 = subplot(3,1,1); 
plot(ax2, t1,x1(:,1)','-b')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,x)';
ax2.Title.String = '';
legend('x(t)')
title('Plot of f(t,x)')

% plot of f(t,y)
ax2 = subplot(3,1,2); 
plot(ax2, t1,x1(:,2)','-r')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,y)';
ax2.Title.String = '';
legend('y(t)')
title('Plot of f(t,y)')

% plot of f(t,z)
ax2 = subplot(3,1,3); 
plot(ax2, t1,x1(:,3)','-y')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,z)';
ax2.Title.String = '';
legend('z(t)')
title('Plot of f(t,z)')


%% Problem #4
clear all, clc, close all

Beta = [10; 28; 8/3];
x0 = [10; 10; 10];
dt = 0.001;
tspan = dt:dt:20;

X(:,1)=x0;
xin = x0;

for i=1:tspan(20000)/dt
    time = i*dt;
    xout = rk4(@(t,y)lorenz(t,y,Beta),dt,time,xin);
    X = [X xout];
    xin = xout;
end

figure('Name'," Question #4 3D Plot")
plot3(X(1,:),X(2,:),X(3,:),'b')
hold on
[t,y] = ode45(@(t,y)lorenz(t,y,Beta),tspan,x0);
plot3(y(:,1),y(:,2),y(:,3),'r')
legend('Runge-Kutta solution','ODE45 Solution')
title('Runge-Kutta Method of Order 4')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

% Subfigures
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));

[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #4 Subfigures of 3rd set of ICs')
% plot of f(t,x)
ax2 = subplot(3,1,1); 
plot(ax2, t1,x1(:,1)','-b')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,x)';
ax2.Title.String = '';
legend('x(t)')
title('Plot of f(t,x)')

% plot of f(t,y)
ax2 = subplot(3,1,2); 
plot(ax2, t1,x1(:,2)','-r')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,y)';
ax2.Title.String = '';
legend('y(t)')
title('Plot of f(t,y)')

% plot of f(t,z)
ax2 = subplot(3,1,3); 
plot(ax2, t1,x1(:,3)','-y')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,z)';
ax2.Title.String = '';
legend('z(t)')
title('Plot of f(t,z)')


function xout = rk4(fun,dt,t0,y0)
f1 = fun(t0,y0);
f2 = fun(t0+dt/2,y0+(dt/2)*f1);
f3 = fun(t0+dt/2,y0+(dt/2)*f2);
f4 = fun(t0+dt,y0+dt*f3);
xout = y0 + (dt/6)*(f1+2*f2+2*f3+f4);
end


function dx = lorenz(t,x,Beta)
% x(1) = x; x(2) = y; x(3) = z;
% beta(1) = sigma; beta(2) = rho; beta(3) = beta

dx = [ Beta(1)*(x(2)-x(1)); 
    x(1)*(Beta(2)-x(3)) - x(2); 
    x(1)*x(2) - Beta(3)*x(3);];
end