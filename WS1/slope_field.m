clear all
clc
close all

y1 = linspace(-50,50,20);
y2 = linspace(-50,50,20);

[uu,vv] = meshgrid(y2,y1);
x1 = zeros(size(uu));
x2 = zeros(size(vv));

a = -2e-1; 
b = 5e-1;
init_time=0; 

loveRJ = @(t,y) [a*y(2); b*y(1)]

for i = 1:numel(uu)
    Yder = loveRJ(init_time,[uu(i); vv(i)]);
    x1(i) = Yder(1);
    x2(i) = Yder(2);
end

figure
quiver(gca,uu,vv,x1,x2,'r'); 
xlabel('Juliet Emotions');
ylabel('Romeo Emotions');
axis tight equal;
% 
% tstart = 0;
% tfinal = 50;
% tspan = [tstart tfinal];
% 
% y0_1 = [2;-1];
% [t,y1] = ode23(@(t,y) loveRJ(t,y),tspan,y0_1);
% figure(gcf)
% hold on
% plot(y1(:,2),y1(:,1),'b')
% plot(y1(1,2),y1(1,1),'mo',... 
% 'MarkerEdgeColor','k',...
%     'MarkerFaceColor',[.49 1 .63],...
%     'MarkerSize',10)
% plot(y1(end,2),y1(end,1),'bs',...
% 'MarkerEdgeColor','k',...
%     'MarkerFaceColor',[.49 .63 1],...
%     'MarkerSize',10)
% 
% y0_2 = [4;1];
% [t,y2] = ode23(@(t,y) loveRJ(t,y),tspan,y0_2);figure(gcf)
% plot(y2(:,2),y2(:,1),'c')
% plot(y2(1,2),y2(1,1),'ko',... 
% 'MarkerEdgeColor','k',...
%     'MarkerFaceColor',[.49 1 .63],...
%     'MarkerSize',10)
% plot(y2(end,2),y2(end,1),'bs',... 
% 'MarkerEdgeColor','k',...
%     'MarkerFaceColor',[.49 .63 1],...
%     'MarkerSize',10)
% hold off
% title("Two solutions plotted on vector field")

%%
clear all 
close all
clc

y1 = linspace(-20,40,10);
y2 = linspace(-20,40,10);

[uu,vv] = meshgrid(y2,y1);
x1 = zeros(size(uu));
x2 = zeros(size(vv));
init_time=0;  

% loveRJ = @(t,y) [a*y(1) + b*y(2); c*y(1) + d*y(2)];

% b_1 = 15;
% a_21 = -0.5;
% a_22 = 0.5;
% loveRJ = @(t,y) [y(2); a_21*y(1) + a_22*y(2) + b_1];

b_1 = 0.5;
b_2 = 2;
c_1 = 2;
c_2 = 0.5;
k = 15
loveRJ = @(t,y) [b_1*y(2)*y(1)+c_1*y(1)*(1-(y(1)/k)); b_2*y(2)*y(1)+c_2*y(2)*(1-(y(2)/k)) ];


for i = 1:numel(uu)
    Yder = loveRJ(init_time,[uu(i); vv(i)]);
    x1(i) = Yder(1);
    x2(i) = Yder(2);
end

figure
quiver(gca,uu,vv,x1,x2,'r'); 
xlabel('Juliet Emotions');
ylabel('Romeo Emotions');
axis tight equal;
grid on