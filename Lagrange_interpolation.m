clear all
close all
clc

x=[1 4 6 5 3 1.5 2.5 3.5]; % initial values
f=@(t) log(t);
y=f(x);
xx=2;
% Lagrange interpolating polynomial
% Uses an (n - 1)-order Lagrange interpolating polynomial based on n data points
% to determine a value of the dependent variable (yint) at xx.
% inputs: x, y, xx
% output: yint = interpolated value of f at xx.
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
s = 0;
for i = 1:n
    product = y(i);
    for j = 1:n
        if i ~= j
            product = product*(xx-x(j))/(x(i)-x(j));
        end
    end
    s = s+product;
end
yint=s

