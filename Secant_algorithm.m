clear all
close all
format long

% Initial values needed to be entered for Example 6.6. pp 158
% Inputs:
fonk=@(x) (exp(-x))-x; % a function to find its root (let's find the roots of sin(x) between x=xl and xu)
xa=0; % initial value-1
xb=1; % initial value-2
es=0.01; % stopping criterion (Stop if the percentage error is less than this)
imax=100; % maximum iteration number (to protect infinite loop)


% Basic Secant algorithm with FOR loop
x_m1= xa; %m1 in the name stands for "minus 1"
x_0=xb; 
tablo=[];
for iter=1:imax
    x_p1 = x_0 - fonk(x_0)*((x_0-x_m1)/(fonk(x_0)-fonk(x_m1))); % Secant Equation for root estimation
    if x_p1 ~= 0 %p1 in the name stands for "plus 1"
        ea = abs((x_p1 - x_0)/x_p1) * 100;
    end
    tablo(iter,:)=[x_m1 x_0 x_p1 ea]; % A table to see the calculation results
    x_m1=x_0; %update x_m1
    x_0=x_p1; %update x_0 
    if (ea<=es)
        break
    end
end

Root_Secant = x_p1
Numb_iter=iter-1


format short