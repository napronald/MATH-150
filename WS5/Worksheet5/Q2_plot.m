clear all, clc, close all

Beta = [10; 28; 8/3];

x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:1;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Plot of 1st set of ICs for 0 < t < 1')
plot3(x(:,1),x(:,2),x(:,3),'g:','LineWidth',1.5);
hold on

x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5);
hold on

x0 = [0.15; 1; 20];

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15");
title('Plot 1 For 0 < t < 1');
xlabel('Rate of Convection');
ylabel('Horizontal Temperature Variation');
zlabel('Vertical Temperature Variation');


%% 
x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:3;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Plot of 1st set of ICs for 0 < t < 3')
plot3(x(:,1),x(:,2),x(:,3),'g:','LineWidth',1.5);
hold on

x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5);
hold on

x0 = [0.15; 1; 20];

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15");
title('Plot 1 For 0 < t < 3');
xlabel('Rate of Convection');
ylabel('Horizontal Temperature Variation');
zlabel('Vertical Temperature Variation');

%%
x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:7;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Plot of 1st set of ICs for 0 < t < 7')
plot3(x(:,1),x(:,2),x(:,3),'g:','LineWidth',1.5);
hold on

x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5);
hold on

x0 = [0.15; 1; 20];

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'b--','LineWidth',1.5);
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15");
title('Plot 1 For 0 < t < 7');
xlabel('Rate of Convection');
ylabel('Horizontal Temperature Variation');
zlabel('Vertical Temperature Variation');

%%

% Subfigures
x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:1;
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
figure('Name','Question #2 Subfigures for 0 < t < 1')
ax2 = subplot(3,1,1); 
plot(ax2, t,x(:,1)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,1)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,1)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'x(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in x(t)')


x0 = [0; 1; 20];
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
ax2 = subplot(3,1,2); 
plot(ax2, t,x(:,2)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,2)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,2)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'y(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in y(t)')

x0 = [0; 1; 20];
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
ax2 = subplot(3,1,3); 
plot(ax2, t,x(:,3)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,3)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,3)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'z(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in z(t)')

%%
x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:3;
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
figure('Name','Question #2 Subfigures for 0 < t < 3')
ax2 = subplot(3,1,1); 
plot(ax2, t,x(:,1)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,1)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,1)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'x(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in x(t)')


x0 = [0; 1; 20];
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
ax2 = subplot(3,1,2); 
plot(ax2, t,x(:,2)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,2)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,2)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'y(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in y(t)')

x0 = [0; 1; 20];
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
ax2 = subplot(3,1,3); 
plot(ax2, t,x(:,3)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,3)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,3)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'z(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in z(t)')

%%
x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:7;
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
figure('Name','Question #2 Subfigures for 0 < t < 7')
ax2 = subplot(3,1,1); 
plot(ax2, t,x(:,1)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,1)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,1)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'x(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in x(t)')


x0 = [0; 1; 20];
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
ax2 = subplot(3,1,2); 
plot(ax2, t,x(:,2)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,2)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,2)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'y(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in y(t)')

x0 = [0; 1; 20];
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
ax2 = subplot(3,1,3); 
plot(ax2, t,x(:,3)','-b')
hold on
x0 = [0.10001; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,3)','-r')
hold on
x0 = [0.15; 1; 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
plot(ax2, t,x(:,3)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'z(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in z(t)')

function dx = lorenz(t,x,Beta)
dx = [ Beta(1)*(x(2)-x(1)); 
    x(1)*(Beta(2)-x(3)) - x(2); 
    x(1)*x(2) - Beta(3)*x(3);];
end