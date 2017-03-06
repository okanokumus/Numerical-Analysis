clear all
close all
format long

% Initial values needed to be entered
% Inputs:
fonk=@(x) 2*sin(x)-(x^2)/10; % a function to find its root (let's find the roots of sin(x) between x=xl and xu)
d_fonk=@(x) 2*cos(x)-x/5;% derivative of the function
d_d_fonk=@(x) -2*sin(x)-0.2;
xr=2.5; % initial value (look for the root around this value)
es=0.001; % stopping criterion (Stop if error is less than this)
imax=100; % maximum iteration number (to protect infinite loop)


% Basic Newton-Raphson algorithm with WHILE loop
iter = 0;
while (1)
    xrold = xr;
    xr = xr - d_fonk(xr)/d_d_fonk(xr); % Newton-Raphson Equation
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100;
    end
    if ((ea <= es) || (iter >= imax))
        break
    end
end

Root_Newt_Raph = xr
Numb_iter=iter


format short