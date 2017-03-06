clc; clear all;
axis([0 7 -1 5])
x=[1;2;3;4;5;6];
y=(-100)*(exp(0.5*x-5));
z=log(y);
n=6;
sum_x=0; sum_xz=0; sr=0;
sum_z=0; sum_x2=0; st=0;
for i=1:n % start:finish:step
    sum_x=sum_x+x(i) ;% i parantez içinde olmadýðý zaman sorun verdi
    sum_z=sum_z+z(i) ;
    sum_xz=sum_xz+x(i)*z(i) ;
    sum_x2=sum_x2+x(i)*x(i) ;
end
xm=sum_x/n;
zm=sum_z/n;
a1=(n*sum_xz-sum_x*sum_z)/(n*sum_x2-sum_x*sum_x);
a0=zm-a1*xm;
for i=1:n
    st=st+(z(i)-zm)^2;
    sr=sr+(z(i)-a1*x(i)-a0)^2;
end
syx=sqrt(sr/(n-2)); % syx: satandart erorr estimate
r2=(st-sr)/st;
hold on
A0=exp(a0);
f=A0+a1*x;
plot(x,f,'r')
grid
y
f

