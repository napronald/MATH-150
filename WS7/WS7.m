%%
% Wolfram Link that calculated optimal values
% https://www.wolframalpha.com/input?i2d=true&i=a-2a%5C%2840%29Power%5Bx%2C2%5D%5C%2841%29-2xy%2BDivide%5B1%2C2%5Dx%3D0%5C%2844%29-2axy%2B%5C%2840%291-2Power%5By%2C2%5D%5C%2841%29%2BDivide%5B1%2C2%5Dy%3D0

% Desmos input

% for a,f(a)
% y=\left(x\left(\frac{x-x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)+x\left(\frac{x-x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)-\frac{1}{4}\right)e^{\left(-\left(\frac{x-x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)^{2}-\left(\frac{1-\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)^{2}\right)}
% y=\left(x\left(\frac{x+x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)+x\left(\frac{x+x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)-\frac{1}{4}\right)e^{\left(-\left(\frac{x+x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)^{2}-\left(\frac{1+\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}\right)^{2}\right)}

% for a,y(a)
% y=\frac{1+\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}
% y=\frac{1-\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}

% for a,x(a)
% y=\frac{x+x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}
% y=\frac{x-x\sqrt{32x^{2}+33}}{8\left(x^{2}+1\right)}


%%
clear all; clc;
% First set of probabilities
% 0,1
s01 = 1/3;
m01 = 1/3;
q01 = 1/3;

% 0,2
m02 = 1/5;

% 1,0
r10 = 1/4;
m10 = 1/4;
p10 = 1/2;

% 1,1
r11 = 1/5;
m11 = 1/5;
p11 = 1/5;
q11 = 1/5;
s11 = 1/5;

% 1,2
r12 = 1/4;
s12 = 1/4;
m12 = 1/4;
p12 = 1/4;

% 2,0
m20 = 1/2;

% 2,1
r21 = 1/4;
s21 = 1/4;
m21 = 1/4;
q21 = 1/4;

% 2,2
r22 = 1/3;
s22 = 1/3;
m22 = 1/3;

%Indicates that in the long run, both populations die out using the first set
[pivec] = pi_vec(s01,m01,q01,m02,r10,m10,p10,r11,m11, ...
    p11,q11,s11,r12,s12,m12,p12,m20,r21,s21,m21,q21,r22,s22,m22)


%% Second set of probabilities
clear all; clc;

% 0,1
s01 = 2/3;
m01 = 1/6;
q01 = 1/6;

% 0,2
m02 = 1/3;

% 1,0
r10 = 1/3;
m10 = 1/3;
p10 = 1/3;

% 1,1
r11 = 4/5;
m11 = 1/20;
p11 = 1/20;
q11 = 1/20;
s11 = 1/20;

% 1,2
r12 = 1/4;
s12 = 1/2;
m12 = 1/8;
p12 = 1/8;

% 2,0
m20 = 1/8;

% 2,1
r21 = 1/5;
s21 = 2/5;
m21 = 1/5;
q21 = 1/5;

% 2,2
r22 = 1/2;
s22 = 1/3;
m22 = 1/6;

%Indicates that in the long run,
[pivec] = pi_vec(s01,m01,q01,m02,r10,m10,p10,r11,m11, ...
    p11,q11,s11,r12,s12,m12,p12,m20,r21,s21,m21,q21,r22,s22,m22)

%% Third set of probabilities
clear all; clc;

% 0,1
s01 = 1/5;
m01 = 1/5;
q01 = 3/5;

% 0,2
m02 = 1/10;

% 1,0
r10 = 5/10;
m10 = 2/10;
p10 = 3/10;

% 1,1
r11 = 1/10;
m11 = 2/10;
p11 = 3/10;
q11 = 2/10;
s11 = 2/10;

% 1,2
r12 = 1/5;
s12 = 1/5;
m12 = 1/5;
p12 = 2/5;

% 2,0
m20 = 1/7;

% 2,1
r21 = 1/5;
s21 = 1/5;
m21 = 2/5;
q21 = 1/5;

% 2,2
r22 = 1/6;
s22 = 1/6;
m22 = 4/6;

%Indicates that in the long run,
[pivec] = pi_vec(s01,m01,q01,m02,r10,m10,p10,r11,m11, ...
    p11,q11,s11,r12,s12,m12,p12,m20,r21,s21,m21,q21,r22,s22,m22)


%%
function [pivec] = pi_vec(s01,m01,q01,m02,r10,m10,p10,r11,m11, ...
    p11,q11,s11,r12,s12,m12,p12,m20,r21,s21,m21,q21,r22,s22,m22)
T = [1 s01 0 r10 0 0 0 0 0;
     0 m01 1-m02 0 r11 0 0 0 0;
     0 q01 m02 0 0 r12 0 0 0;
     0 0 0 m10 s11 0 1-m20 0 0;
     0 0 0 0 m11 s12 0 r21 0;
     0 0 0 0 q11 m12 0 0 r22;
     0 0 0 p10 0 0 m20 s21 0;
     0 0 0 0 p11 0 0 m21 s22;
     0 0 0 0 0 p12 0 q21 m22];

pivec = T^10000;
end