clear all;clc;close all;
x=[1;3;5;7;10;12;13;16;18;20];
y=[4;5;6;5;8;7;6;9;12;11];
n=10;
sum_x=0; sum_xy=0; sr=0;
sum_y=0; sum_x2=0; st=0;
for i=1:n % start:finish:step
    sum_x=sum_x+x(i) ;% i parantez içinde olmadýðý zaman sorun verdi
    sum_y=sum_y+y(i) ;
    sum_xy=sum_xy+x(i)*y(i) ;
    sum_x2=sum_x2+x(i)*x(i) ;
end
xm=sum_x/n;
ym=sum_y/n;
a1=(n*sum_xy-sum_x*sum_y)/(n*sum_x2-sum_x*sum_x);
a0=ym-a1*xm;
for i=1:n
    st=st+(y(i)-ym)^2;
    sr=sr+(y(i)-a1*x(i)-a0)^2;
end
syx=sqrt(sr/(n-2)); % syx: satandart erorr estimate
r2=(st-sr)/st;
hold on
scatter(x,y)
y_new=a0+a1*x;
plot(x,y_new,'r')
grid
% how can we change the interval of x and y? I would like to show the y in the interval of 0 to 15. Is it possible?
% if you want to change the intervals of coordinates you should use 'axis ([xmin xmax ymin ymax]).
