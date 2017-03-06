% Trapezoidal and Simpson Rule
clear all; clc;
format long

% 1. True value(analytical calculation)
% A1= 2.501239376088333
 A1=2.501239376088333

% 2. Single application of the trapezoidal rule
% A2=  1.496281871735000
xl=0; xu=3;
h=(xu-xl);
f=@(x) 1-exp(-2*x);
A2= h*(f(xu)+f(xl))/2; % true error=(A1-A2)/A1*100= 40.1784%
A2

% 3. Multiple-application trapezoidal rule with n=2
% A3=  2.173460333315704
a=0; b=3; n=2;
f=@(x) 1-exp(-2*x);
h=(b-a)/n;
sum=0;
sum=sum+f(a);
    for i= (a+h):h:(b-h)
    sum=sum+2*f(i);
    end

sum=sum+f(b);
A3=h*sum/2; % error = 13.1047%
A3

% 4. Multiple-application trapezoidal rule with n=4
% A4=  2.411050799142848
a=0; b=3; n=4;
f=@(x) 1-exp(-2*x);
h=(b-a)/n;
sum=0;
sum=sum+f(a);
    for i= (a+h):h:(b-h)
    sum=sum+2*f(i);
    end

sum=sum+f(b);
A4=h*sum/2; % error =  3.6058 %
A4

% 5. Single application of Simpson's 1/3 rule
% A5=2.399186487175939
x0=0; x2=3;
x1=(x2+x0)/2;
h=(x2-x0)/2;
f=@(x) 1-exp(-2*x);
A5=h*(f(x0)+4*f(x1)+f(x2))/3; % error = 4.0801%
A5

% 6. Multiple application Simpson's 1/3 rule with n=4
% A6=
a=0; b=3; n=4;
f=@(x) 1-exp(-2*x);
h=(b-a)/n;
sum_even=0;
for i=(a+2*h):(2*h):(b-2*h)
   sum_even=sum_even+f(i);
end
sum_odd=0;
for j=(a+h):(2*h):(b-h)
   sum_odd=sum_odd+f(j);
end
A6=h*(f(a)+4*sum_odd+2*sum_even+f(b))/3 ; % error =  0.4395%
A6

% 7. Single application of Simpson's 3/8 rule
% A7=
a=0; b=3;
h=(b-a)/3;
a1=a+h;
b1=b-h;
f=@(x) 1-exp(-2*x);
A7=3*h*(f(a)+3*f(a1)+3*f(b1)+f(b))/8 ; % error =   2.0001%
A7

% 8. Multiple application Simpson's 3/8 rule with n=5
% A8=
xl=0; x2=1.2; xu=3;
x1=(x2+xl)/2;
h=(x2-xl)/2;
f=@(x) 1-exp(-2*x);
first_part=h*(f(xl)+4*f(x1)+f(x2))/3;
x3=x2+h;
x4=xu-h;
second_part=3*h*(f(x2)+3*f(x3)+3*f(x4)+f(xu))/8;
sum=first_part+second_part; % error = 0.2121%
A8=sum

% 9. Use "integral" command of MATLAB for numerical integration 
% A9=
syms x;
A9=int(1-exp(-2*x),0,3);% This expression is the same as A1. So true error is zero
A9

% 10. Use "quad" command of MATLAB for numerical integration
% A10=
f=@(x) 1-exp(-2*x);
A10=quad(f,0,3)

format short
% 11. Calculate the percent relative true errors for each case above and 
%make a table to express errors with a variable named Atable in your m-file.
% Atable=
disp('11. Atable: ')
disp('Mared as in the question :|    2    |    3    |   4    |    5   |    6   |    7   |    8   |      9       |     10      |')
disp('-------------------------------------------------------------------------------------------------------------------------')
disp('Relative true error (%)  :| 40.1784 | 13.1047 | 3.6058 | 4.0801 | 0.4395 | 2.0001 | 0.2121 | -1.7755e-014 | 2.0367e-006 |')
disp('                                                                                                                         ')
disp('                                                                                                                         ')   
disp('>> Which method has the minimum error?')
disp('>> As shown in the table," Multiple application Simpson 3/8 rule with n=5" is nearly the same as analytical solution.')