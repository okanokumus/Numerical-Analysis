clear all
close all
clc

x=[1 4 6 5 3 1.5 2.5 3.5]; % initial values
f=@(t) log(t);
y=f(x);
xx=2;
% Uses an (n - 1)-order Newton interpolating polynomial based on n data points (x, y)
% to determine a value of the dependent variable (yint) at a given value of the independent variable, xx.
% input: x = initial points; y = f(x); xx = interpolation will be calculated at x=xx
% output: yint = interpolated value of xx  ( true value is ytrue=f(xx) )
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
b = zeros(n,n);
% assign dependent variables to the first column of b.
b(:,1) = y(:); % the (:) ensures that y is a column vector.
for j = 2:n
    for i = 1:n-j+1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end
% use the finite divided differences to interpolate
xt = 1;
yint = b(1,1);
for j = 1:n-1
    xt = xt*(xx-x(j));
    yint = yint+b(1,j+1)*xt;
end
out_b_coeffs=(b(1,:))
out_yint=yint

