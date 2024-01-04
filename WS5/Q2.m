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

% options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
% [t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

% plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
% hold on
% set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
% set(gcf,'color','w');
% title('Plot 1 For 0 < t < 1')
% xlabel('Rate of Convection')
% ylabel('Horizontal Temperature Variation')
% zlabel('Vertical Temperature Variation')




x0 = [0.10001; 1; 20];
dt = 0.001;
tspan = 0:dt:3;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5);
hold on

% options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
% [t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

% plot3(x(:,1),x(:,2),x(:,3),'y--','LineWidth',1.5);
% hold on
% set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
% set(gcf,'color','w');
% title('Plot 2 For 0 < t < 3')
% xlabel('Rate of Convection')
% ylabel('Horizontal Temperature Variation')
% zlabel('Vertical Temperature Variation')




x0 = [0.15; 1; 20];
dt = 0.001;
tspan = 0:dt:7;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'c--','LineWidth',1.5);
hold on

% options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
% [t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

% plot3(x(:,1),x(:,2),x(:,3),'m','LineWidth',1.5);
% set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
% set(gcf,'color','w');
% title('Plot 3 For 0 < t < 7')
% xlabel('Rate of Convection')
% ylabel('Horizontal Temperature Variation')
% zlabel('Vertical Temperature Variation')

legend('Tolerance of 1e-12 for 0<t<1','Tolerance of 1e-6 for 0<t<1','Tolerance of 1e-12 for 0<t<3','Tolerance of 1e-6 for 0<t<3','Tolerance of 1e-12 for 0<t<7','Tolerance of 1e-6 for 0<t<7')

x0 = [0.10001; 1; 20];
dt = 0.001;
tspan = 0:dt:3;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));

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

%% Functions

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