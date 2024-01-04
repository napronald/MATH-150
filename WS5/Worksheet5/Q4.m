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