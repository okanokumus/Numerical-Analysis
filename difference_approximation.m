clear all
%Approximate the derivative at each point by using Forward difference
%approximation at the first point, Backward difference approximation at the
%last point and Centered difference approximation at centering points
f=@(x) -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.25; % function f
f_d=@(x) -0.4*x^3-0.45*x^2-x-0.25; %derivative of the function f

xi=0.5;
h=0.25;

% Forward difference approximation O(h^2):
f_d_a=(-f(xi+h+h)+4*f(xi+h)-3*f(xi))/(2*h);
err_a=((f_d(xi)-f_d_a)/f_d(xi))*100;

% Backward difference approximation O(h^2):
f_d_b=(3*f(xi)-4*f(xi-h)+f(xi-h-h))/(2*h);
err_b=((f_d(xi)-f_d_b)/f_d(xi))*100;

% Centered difference approximation O(h^4):
f_d_c=(-f(xi+h+h)+8*f(xi+h)-8*f(xi-h)+f(xi-h-h))/(12*h);
err_c=((f_d(xi)-f_d_c)/f_d(xi))*100;

tablo=[f_d(xi) f_d_a f_d_b f_d_c;0 err_a err_b err_c]