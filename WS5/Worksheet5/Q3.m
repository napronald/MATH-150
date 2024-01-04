clear all; clc; close all

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


%%

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
legend('x(t)','y(t)','z(t)')
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
ax2.YLabel.String = 'x(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in x(t)')




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
ax2.YLabel.String = 'x(t)';
ax2.Title.String = '';
legend('x(t)','y(t)','z(t)')
title('Time Evolution of the Dimension in x(t)')



function dx = lorenz(t,x,Beta)
dx = [ Beta(1)*(x(2)-x(1)); 
    x(1)*(Beta(2)-x(3)) - x(2); 
    x(1)*x(2) - Beta(3)*x(3);];
end