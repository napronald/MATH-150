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