clear all
clc
close all

a = 2e-1; 
b = 5e-1;
loveRJ = @(t,y) [a*y(2); b*y(1)];

tstart = 0;
tfinal = 50;
tspan = [tstart tfinal];
y0 = [0.5;1]; 

[t,y] = ode23(@(t,y) loveRJ(t,y),tspan,y0);
plot(t,y')

ax = gca;
ax.XLim = [0 5];
ax.YLim = [-3 3];
ax.XLabel.String = 'Time';
ax.YLabel.String = 'Emotions';
ax.Title.String = 'For 2b a_i_j > 0 R(0), J(0) > 0';
legend('Romeo','Juliet')

%%
clear all
clc
close all

% original parameters
% a = -0.15;
% d = 0.17;
% b = 0.9; 
% c = -0.9;

% All negatives
a = -0.15;
d = -0.17;
b = -0.9; 
c = -0.9;

% All positives
% a = 0.15;
% d = 0.17;
% b = 0.9; 
% c = 0.9;

% a_11, a_21 > 0 and a_12, a_22 < 0
% a = 0.15;
% d = -0.17;
% b = -0.9; 
% c = 0.9;

% observation 
% a = 1;
% d = -1;
% b = -1; 
% c = 1; 

tstart = 0;
tfinal = 50;
tspan = [tstart tfinal];

y0 = [1.00;-0.5];
% y0 = [-1.00;0.5];

[t2,y2] = ode23(@(t,y) loveRJ_simple(t,y,a,d) ,tspan,y0);
[t1,y1] = ode23(@(t,y) loveRJ_ownEffect(t,y,a,b,c,d) ,tspan,y0);

figure
ax1 = subplot(2,1,1);
plot(ax1, t1,y1')
ax1.YLim = [-2 2];
ax1.XLabel.String = 'Time';
ax1.YLabel.String = 'Emotions';
% ax1.Title.String = 'Romeo & Juliet''s relationship - self-effect(complex)';
ax1.Title.String = 'Romeo & Juliet''s relationship - simple';
legend('Romeo','Juliet')

ax2 = subplot(2,1,2); 
plot(ax2, t2,y2')
ax2.YLim = [-1.5 1.5];
ax2.XLabel.String = 'Time';
ax2.YLabel.String = 'Emotions';
% ax2.Title.String = 'Romeo & Juliet''s relationship - simple';
ax2.Title.String = 'Romeo & Juliet''s relationship - self-effect(complex)';
legend('Romeo','Juliet')

%%
close all
clear all
clc

y1 = linspace(-30,30,20);
y2 = linspace(-30,30,20);

[uu,vv] = meshgrid(y2,y1);
x1 = zeros(size(uu));
x2 = zeros(size(vv));

init_time=0;  

b_1 = -0.5;
b_2 = 2;
c_1 = 2;
c_2 = 0.5;
k = 15;
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

tstart = 0;
tfinal = 50;
tspan = [tstart tfinal];

y0_1 = [5e-27;1e-26];
% y0_1 = [1e-26;-1e-26];
[t,y1] = ode23(@(t,y) loveRJ(t,y),tspan,y0_1);
figure(gcf)
hold on
plot(y1(:,2),y1(:,1),'b')
plot(y1(1,2),y1(1,1),'mo',... 
'MarkerEdgeColor','r',...
    'MarkerFaceColor',[.49 1 .63],...
    'MarkerSize',20)
plot(y1(end,2),y1(end,1),'bs',...
'MarkerEdgeColor','r',...
    'MarkerFaceColor',[.49 .63 1],...
    'MarkerSize',10)

% y0_2 = [1e-25;1e-26];
y0_2 = [1e-44;-5e-80];
[t,y2] = ode23(@(t,y) loveRJ(t,y),tspan,y0_2);figure(gcf)
plot(y2(:,2),y2(:,1),'c')
plot(y2(1,2),y2(1,1),'ko',... 
'MarkerEdgeColor','k',...
    'MarkerFaceColor',[.49 1 .63],...
    'MarkerSize',10)
plot(y2(end,2),y2(end,1),'bs',... 
'MarkerEdgeColor','k',...
    'MarkerFaceColor',[.69 .63 1],...
    'MarkerSize',10)
hold off
title("Two solutions plotted on vector field")

function dy = loveRJ_simple(t,y,a,b)
dR = a*y(2);
dJ = b*y(1);
dy = [dR;dJ];
end

function dy = loveRJ_ownEffect(t,y,a,b,c,d)
dR  = a*y(1) + b*y(2);
dJ = c*y(1) + d*y(2);
dy = [dR;dJ];
end