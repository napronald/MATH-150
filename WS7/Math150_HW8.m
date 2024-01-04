clear all, close all, clc

% Method 1
 T = [0 0 1/2; 1/2 1/3 0; 1/2 2/3 1/2] 

T_100 = T^1000

 pi = [535/2006; 1/5; 1065/1997]   

lambda1 = 2  ;
lambda2 = 3  ;
lambda3 = 4  ;

num1 = pi(1) / lambda1  ;
num2 = pi(2) / lambda2  ;
num3 = pi(3) / lambda3  ; 

denom = (pi(1)/lambda1) + (pi(2)/lambda2) + (pi(3)/lambda3) ;

p1 = num1 / denom;
p2 = num2 / denom;
p3 = num3 / denom;

pvec = [p1;p2;p3]