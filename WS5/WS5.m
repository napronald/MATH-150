%% Problem #1
clear all, clc, close all

Beta = [10; 28; 8/3];
x0 = [0; 1; 20];
dt = 0.001;
tspan = dt:dt:50;

figure
ax1 = subplot(2,1,1);
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

tstart = 0;
tfinal = 50;
tspan = [tstart tfinal];

y0 = [1.00;-0.5];
% y0 = [-1.00;0.5];

% [t2,y2] = ode23(@(t,y) loveRJ_simple(t,y,a,d) ,tspan,y0);
% [t1,y1] = ode23(@(t,y) loveRJ_ownEffect(t,y,a,b,c,d) ,tspan,y0);
[t1,x1] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

% plots f(t,x) f(t,y) f(t,z)
ax2 = subplot(2,1,2); 
% plot(ax2, t1,x1(:,1)')
plot(ax2, t1,x1')
ax2.XLabel.String = 't';
ax2.YLabel.String = 'f(t,x) f(t,y) f(t,z)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')

% [t1,y1] = ode45(@(t,y)lorenz(t,y,Beta),tspan,x0,options);

% plot(ax2, t1,y1')
% ax2.YLim = [0 1.5];
% ax2.XLabel.String = 'Time';
% ax2.YLabel.String = 'Emotions';
% ax2.Title.String = 'Romeo & Juliet''s relationship - self-effect(complex)';
% legend('Romeo','Juliet')


%% Problem #2
clear all, clc, close all

Beta = [10; 28; 8/3];
x0 = [0; 1; 20];
dt = 0.001;
tspan = 0:dt:1;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure(1)
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Plot 1 For 0 < t < 1')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

x0 = [0.10001; 1; 20];
dt = 0.001;
tspan = 0:dt:3;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure(2)
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Plot 2 For 0 < t < 3')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

x0 = [0.15; 1; 20];
dt = 0.001;
tspan = 0:dt:7;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

figure(3)
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5);
hold on

options = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5);
set(gca,'color','w', 'xcolor', 'k', 'ycolor' ,'k', 'zcolor','k');
set(gcf,'color','w');
legend('Tolerance of 1e-12','Tolerance of 1e-6')
title('Plot 3 For 0 < t < 7')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')

%% Problem #3
clear all, clc, close all

%  0 < sigma < 1; rho = 1; 0 < beta < 20
Beta = [0.5; 1; 10];
x0 = [0; 1; 20];
dt = 0.001;
tspan = dt:dt:50;

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
title('Question 3')
xlabel('Rate of Convection')
ylabel('Horizontal Temperature Variation')
zlabel('Vertical Temperature Variation')


%% Problem #4
clear all, clc, close all

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