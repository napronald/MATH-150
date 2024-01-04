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
title('3D PLot for Question 1')
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
ax2.YLabel.String = 'x(t)';
ax2.Title.String = '';
legend('Tolerance 1e-12','Tolerance 1e-6')
title('Plot for x(t)')

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
ax2.YLabel.String = 'y(t)';
ax2.Title.String = '';
legend('Tolerance 1e-12','Tolerance 1e-6')
title('Plot for y(t)')

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
ax2.YLabel.String = 'z(t)';
ax2.Title.String = '';
legend('Tolerance 1e-12','Tolerance 1e-6')
title('Plot for z(t)')

%% Problem #2

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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
title('Time Evolution of the Dimension in z(t)')


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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
title('Time Evolution of the Dimension in z(t)')


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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
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
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
title('Time Evolution of the Dimension in z(t)')

%% Problem #3

x0 = [0; 1; 20];    

dt = 0.001;         
tspan = dt:dt:50;
    
Beta = [10; 1e-5; 8/3];         

options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure('Name','Question #2 3D Plot of 1st set of ICs for 0 < t < 1')
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

Beta = [10; 1; 8/3];  

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5);
hold on

Beta = [10; 10; 8/3];      

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5);
legend("0 < {\rho} < 1", "{\rho} = 1", "1 < {\rho} < 20")
title('Plot 1 For 0 < t < 1');
xlabel('Rate of Convection');
ylabel('Horizontal Temperature Variation');
zlabel('Vertical Temperature Variation');


figure('Name','Question #3 Subfigures')
ax2 = subplot(3,1,1); 
Beta = [10; 1e-5; 8/3];         

options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot(ax2, t,x(:,1)','-b')
hold on

Beta = [10; 1; 8/3];  

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t,x(:,1)','-r')
hold on

Beta = [10; 10; 8/3];      

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t,x(:,1)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'x(t)';
ax2.Title.String = '';
legend("0 < {\rho} < 1", "{\rho} = 1", "1 < {\rho} < 20")
title('Time Evolution of the Dimension in x(t)')


ax2 = subplot(3,1,2); 
Beta = [10; 1e-5; 8/3];         

options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot(ax2, t,x(:,2)','-b')
hold on

Beta = [10; 1; 8/3];  

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t,x(:,2)','-r')
hold on

Beta = [10; 10; 8/3];      

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t,x(:,2)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'y(t)';
ax2.Title.String = '';
legend("0 < {\rho} < 1", "{\rho} = 1", "1 < {\rho} < 20")
title('Time Evolution of the Dimension in y(t)')


ax2 = subplot(3,1,3); 
Beta = [10; 1e-5; 8/3];         

options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot(ax2, t,x(:,3)','-b')
hold on

Beta = [10; 1; 8/3];  

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t,x(:,3)','-r')
hold on

Beta = [10; 10; 8/3];      

[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot(ax2, t,x(:,3)','-g')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'z(t)';
ax2.Title.String = '';
legend("0 < {\rho} < 1", "{\rho} = 1", "1 < {\rho} < 20")
title('Time Evolution of the Dimension in z(t)')


%% Problem #4

Beta = [10; 28; 8/3];
x0 = [10; 10; 10];
dt = 0.001;
tspan = dt:dt:20;

X(:,1)=x0;
xin = x0;

for i=2:tspan(20000)/dt
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

figure('Name','Question #4 Subfigures of ODE Solver/Runge Kutta')
subplot(3,1,1)
plot(t,y(:,1),'r')
hold on
plot(t,X(1,:),'b--')
xlabel('t')
ylabel('x')
title('Time Evolution of the Dimension in x(t)')
legend("ODE45 Solver","Runge Kutta Solution")

subplot(3,1,2)
plot(t,y(:,2),'r')
hold on
plot(t,X(2,:),'b--')
xlabel('t')
ylabel('y')
title('Time Evolution of the Dimension in y(t)')
legend("ODE45 Solver","Runge Kutta Solution")

subplot(3,1,3)
plot(t,y(:,3),'r')
hold on
plot(t,X(3,:),'b--')
xlabel('t')
ylabel('z')
title('Time Evolution of the Dimension in z(t)')
legend("ODE45 Solver","Runge Kutta Solution")


%% Functions

function xout = rk4(fun,dt,t0,y0)
f1 = fun(t0,y0);
f2 = fun(t0+dt/2,y0+(dt/2)*f1);
f3 = fun(t0+dt/2,y0+(dt/2)*f2);
f4 = fun(t0+dt,y0+dt*f3);
xout = y0 + (dt/6)*(f1+2*f2+2*f3+f4);
end

function dx = lorenz(t,x,Beta)
dx = [ Beta(1)*(x(2)-x(1)); 
    x(1)*(Beta(2)-x(3)) - x(2); 
    x(1)*x(2) - Beta(3)*x(3);];
end