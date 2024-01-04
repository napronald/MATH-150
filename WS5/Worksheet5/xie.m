%% QUESTION #1 

% Define BETA Vector 
Beta = [10; 28; 8/3]  ;       % Classic LORENZ Chaotic Values for sigma, rho, beta


% Define INITIAL CONDITIONS 
x0 = [0; 1; 20]       ;      % (X0, Y0, Z0)

dt = 0.001  ;                % Time step 
tspan = dt:dt:50  ;          % Vector of time in increments of dt from 0.001 TO 50 (~ 50,000 Time steps)



% Control error tolerances --> Simulate more accurately
options1 = odeset('RelTol', 1e-12, 'AbsTol', 1e-12*ones(1,3)) ;      % using 10^-12  
options2 = odeset('RelTol', 1e-6, 'AbsTol', 1e-6*ones(1,3)) ;        % using 10^-6


% ode45 : function of TIME (t) & SPACE (x) 
tic
[t1, x1] = ode45(@(t,x) Lorenz(t,x,Beta), tspan, x0, options1)  ;    % Solution using error tolerance of 10^-12
toc

tic
[t2, x2] = ode45(@(t,x) Lorenz(t,x,Beta), tspan, x0, options2)  ;    % Solution using error tolerance of 10^-6
toc




               %%%% Display plot of LORENZ BUTTERFLY ATTRACTOR at different angles %%%%
% PLot 3D SOLUTIONS 
figure(1)
plot3(x1(:,1), x1(:,2), x1(:,3), 'r', 'LineWidth', 1.5)                  % Plot solution using 10^-12 in RED
hold on
plot3(x2(:,1), x2(:,2), x2(:,3), 'b', 'LineWidth', 1.5)                  % Plot solution using 10^-6 in BLUE

xlabel('x')
ylabel('y')
zlabel('z')
title('3D Solutions using 10^{-12} and 10^{-6} Error Tolerances')
legend('10^{-12} Error Tolerance', '10^{-6} Error Tolerance')
set(legend, 'Location', 'BestOutside')                                  % Move legend OUTSIDE a graph 
grid on



% Plot 3 SUBFIGURES of the 3D solutions ----> 1 in each dimension: x(t), y(t), z(t) %%%
figure(2)

% For x(t)
subplot(3,1,1)
plot(t1, x1(:,1), 'r')                  % Plot solution using 10^-12 in RED
hold on
plot(t2, x2(:,1), 'b')                  % Plot solution using 10^-6 in BLUE
xlabel('t')
ylabel('x')
title('Time Evolution of the Dimension in x(t)')
legend('10^{-12} Error Tolerance', '10^{-6} Error Tolerance')
set(legend, 'Location', 'BestOutside')

% For y(t)
subplot(3,1,2)
plot(t1, x1(:,2), 'r')                  % Plot solution using 10^-6 in RED
hold on 
plot(t2, x2(:,2), 'b')                  % Plot solution using 10^-6 in BLUE
xlabel('t')
ylabel('y')
title('Time Evolution of the Dimension in y(t)')


% For z(t)
subplot(3,1,3)
plot(t1, x1(:,3), 'r')                  % Plot solution using 10^-6 in RED
hold on
plot(t2, x2(:,3), 'b')                  % Plot solution using 10^-6 in BLUE
xlabel('t')
ylabel('z')
title('Time Evolution of the Dimension in z(t)')





%% QUESTION 2 

Beta = [10; 28; 8/3];   % LORENZ Chaotic Values for sigma, rho, beta

% 3 different Initial Conditions (I.C.s)
x0_1 = [0; 1; 20];            % 1st I.C.
x0_2 = [0.10001; 1; 20];      % 2nd I.C.
x0_3 = [0.15; 1; 20];         % 3rd I.C.

% 3 different values of T 
dt = 0.001;
tspan1 = 0:dt:1;           % T = 1   -----> 0 <= t <= 1 
tspan2 = 0:dt:3;           % T = 3   -----> 0 <= t <= 3 
tspan3 = 0:dt:7;           % T = 7   -----> 0 <= t <= 7 


options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12*ones(1,3));       % SAME Error Tolerances = 10^-12


% Plot 3 I.C.s in the SAME figure (1 set of figures for EACH value of T)


        %%%% Solutions w/ the 3 I.C.s with time segment: T = 1 %%%% 
[t1,x1] = ode45(@(t,x)Lorenz(t,x,Beta), tspan1, x0_1, options);     % 1st I.C. 
[t2,x2] = ode45(@(t,x)Lorenz(t,x,Beta), tspan1, x0_2, options);     % 2nd I.C.
[t3,x3] = ode45(@(t,x)Lorenz(t,x,Beta), tspan1, x0_3, options);     % 3rd I.C. 

% Plot 3D solutions (for 0 <= t <= 1 ---> T = 1) 
figure(3)
plot3(x1(:,1), x1(:,2), x1(:,3), 'r', 'LineWidth', 1.5);     
hold on
plot3(x2(:,1), x2(:,2), x2(:,3), 'b', 'LineWidth', 1.5);   
plot3(x3(:,1), x3(:,2), x3(:,3), 'g', 'LineWidth', 1.5);   
xlabel('x')
ylabel('y')
zlabel('z')
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
title('3D Solutions with different I.C.s and time segment of 0 <= t <= 1')
grid on


% Subplot for each dimensions (for 0 <= t <= 1 ----> T = 1) 
% For x(t)
figure(4)
subplot(3,1,1)
plot(t1, x1(:,1), 'r')    
hold on
plot(t2, x2(:,1), 'b')   
plot(t3, x3(:,1), 'g')   
xlabel('t')
ylabel('x')
title('Time Evolution of the Dimension in x(t)')
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
set(legend, 'Location', 'BestOutside')

% For y(t) 
subplot(3,1,2)
plot(t1, x1(:,2), 'r')    
hold on
plot(t2, x2(:,2), 'b')   
plot(t3, x3(:,2), 'g')   
xlabel('t')
ylabel('y')
title('Time Evolution of the Dimension in y(t)')

% For z(t) 
subplot(3,1,3)
plot(t1, x1(:,3), 'r')    
hold on
plot(t2, x2(:,3), 'b')   
plot(t3, x3(:,3), 'g')   
xlabel('t')
ylabel('z')
title('Time Evolution of the Dimension in z(t)')





       %%%% Solutions w/ the 3 I.C.s with time segment: T = 3 %%%% 
[t4,x4] = ode45(@(t,x)Lorenz(t,x,Beta), tspan2, x0_1, options);     % 1st I.C. 
[t5,x5] = ode45(@(t,x)Lorenz(t,x,Beta), tspan2, x0_2, options);     % 2nd I.C.
[t6,x6] = ode45(@(t,x)Lorenz(t,x,Beta), tspan2, x0_3, options);     % 3rd I.C. 

% Plot 3D solutions (for 0 <= t <= 3 ---> T = 3) 
figure(5)
plot3(x4(:,1), x4(:,2), x4(:,3), 'r', 'LineWidth', 1.5);     
hold on
plot3(x5(:,1), x5(:,2), x5(:,3), 'b', 'LineWidth', 1.5);   
plot3(x6(:,1), x6(:,2), x6(:,3), 'g', 'LineWidth', 1.5);   
xlabel('x')
ylabel('y')
zlabel('z')
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
title('3D Solutions with different I.C.s and time segment of 0 <= t <= 3')
grid on


% Subplot for each dimensions (for 0 <= t <= 3 ----> T = 3) 
% For x(t)
figure(6)
subplot(3,1,1)
plot(t4, x4(:,1), 'r')    
hold on
plot(t5, x5(:,1), 'b')   
plot(t6, x6(:,1), 'g')   
xlabel('t')
ylabel('x')
title('Time Evolution of the Dimension in x(t)')
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
set(legend, 'Location', 'BestOutside')

% For y(t) 
subplot(3,1,2)
plot(t4, x4(:,2), 'r')    
hold on
plot(t5, x5(:,2), 'b')   
plot(t6, x6(:,2), 'g')   
xlabel('t')
ylabel('y')
title('Time Evolution of the Dimension in y(t)')

% For z(t) 
subplot(3,1,3)
plot(t4, x4(:,3), 'r')    
hold on
plot(t5, x5(:,3), 'b')   
plot(t6, x6(:,3), 'g')   
xlabel('t')
ylabel('z')
title('Time Evolution of the Dimension in z(t)')




        %%%% Solutions w/ the 3 I.C.s with time segment: T = 7 %%%% 
[t7,x7] = ode45(@(t,x)Lorenz(t,x,Beta), tspan3, x0_1, options);     % 1st I.C. 
[t8,x8] = ode45(@(t,x)Lorenz(t,x,Beta), tspan3, x0_2, options);     % 2nd I.C.
[t9,x9] = ode45(@(t,x)Lorenz(t,x,Beta), tspan3, x0_3, options);     % 3rd I.C. 

% Plot 3D solutions (for 0 <= t <= 7 ---> T = 7) 
figure(7)
plot3(x7(:,1), x7(:,2), x7(:,3), 'r', 'LineWidth', 1.5);     
hold on
plot3(x8(:,1), x8(:,2), x8(:,3), 'b', 'LineWidth', 1.5);   
plot3(x9(:,1), x9(:,2), x9(:,3), 'g', 'LineWidth', 1.5);   
xlabel('x')
ylabel('y')
zlabel('z')
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
title('3D Solutions with different I.C.s and time segment of 0 <= t <= 7')
grid on


% Subplot for each dimensions (for 0 <= t <= 7 ----> T = 7) 
% For x(t)
figure(8)
subplot(3,1,1)
plot(t7, x7(:,1), 'r')    
hold on
plot(t8, x8(:,1), 'b')   
plot(t9, x9(:,1), 'g')   
xlabel('t')
ylabel('x')
title('Time Evolution of the Dimension in x(t)')
legend("x_{0} = 0", "x_{0} = 0.10001", "x_{0} = 0.15")
set(legend, 'Location', 'BestOutside')

% For y(t) 
subplot(3,1,2)
plot(t7, x7(:,2), 'r')    
hold on
plot(t8, x8(:,2), 'b')   
plot(t9, x9(:,2), 'g')   
xlabel('t')
ylabel('y')
title('Time Evolution of the Dimension in y(t)')

% For z(t) 
subplot(3,1,3)
plot(t7, x7(:,3), 'r')    
hold on
plot(t8, x8(:,3), 'b')   
plot(t9, x9(:,3), 'g')   
xlabel('t')
ylabel('z')
title('Time Evolution of the Dimension in z(t)')






%% Number 3

x0 = [0; 1; 20];        % SAME I.C. as QUESTION #1  

dt = 0.001;             % SAME dt & tspan as QUESTION #1
tspan = dt:dt:50;
    
Beta1 = [10; 1e-5; 8/3];       % 0 < p < 1
Beta2 = [10; 1; 8/3];          % p = 1
Beta3 = [10; 10; 8/3];         % 1 < p < 20

options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12*ones(1,3));           % SAME Error Tolerances = 10^-12


                     %%%% Plot of solutions using different values of rho %%%%
[t1_1,x1_1] = ode45(@(t,x)Lorenz(t,x,Beta1), tspan, x0, options);           % rho = 1e^-5 
[t2_2,x2_2] = ode45(@(t,x)Lorenz(t,x,Beta2), tspan, x0, options);           % rho = 1
[t3_3,x3_3] = ode45(@(t,x)Lorenz(t,x,Beta3), tspan, x0, options);           % rho = 10




% Plot 3D solutions (for rho = 1e^-5 -----> 0 < rho < 1)
figure(9)
plot3(x1_1(:,1), x1_1(:,2), x1_1(:,3), 'r', 'LineWidth', 1.5);     
hold on
plot3(x2_2(:,1), x2_2(:,2), x2_2(:,3), 'b', 'LineWidth', 1.5);   
plot3(x3_3(:,1), x3_3(:,2), x3_3(:,3), 'g', 'LineWidth', 1.5);   
xlabel('x')
ylabel('y')
zlabel('z')
legend("0 < {\rho} < 1", "{\rho} = 1", "1 < {\rho} < 20")
title('3D Solutions with different values of {\rho}')
grid on


% Subplot for each dimensions (for 0 <= t <= 7 ----> T = 7) 
% For x(t)
figure(10)
subplot(3,1,1)
plot(t1_1, x1_1(:,1), 'r')    
hold on
plot(t2_2, x2_2(:,1), 'b')   
plot(t3_3, x3_3(:,1), 'g')   
xlabel('t')
ylabel('x')
title('Time Evolution of the Dimension in x(t)')
legend("0 < {\rho} < 1", "{\rho} = 1", "1 < {\rho} < 20")
set(legend, 'Location', 'BestOutside')

% For y(t) 
subplot(3,1,2)
plot(t1_1, x1_1(:,2), 'r')    
hold on
plot(t2_2, x2_2(:,2), 'b')   
plot(t3_3, x3_3(:,2), 'g')   
xlabel('t')
ylabel('y')
title('Time Evolution of the Dimension in y(t)')

% For z(t) 
subplot(3,1,3)
plot(t1_1, x1_1(:,3), 'r')    
hold on
plot(t2_2, x2_2(:,3), 'b')   
plot(t3_3, x3_3(:,3), 'g')   
xlabel('t')
ylabel('z')
title('Time Evolution of the Dimension in z(t)')


function dx = Lorenz(t,x,Beta)
dx = [ Beta(1)*(x(2)-x(1)); 
    x(1)*(Beta(2)-x(3)) - x(2); 
    x(1)*x(2) - Beta(3)*x(3);];
end