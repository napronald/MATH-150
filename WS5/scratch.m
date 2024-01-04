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
