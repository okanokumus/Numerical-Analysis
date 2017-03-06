clear all
clc

x=[1;3;5;7;10;12;13;16;18;20];
y=[4;5;6;5;8;7;6;9;12;11];

sumx=0;
sumxy=0;
st=0;
sumy=0;
sumx2=0;
sr=0;

n=size(x,1);
for i=1:n
    sumx=sumx+x(i);
    sumy=sumy+y(i);
    sumxy=sumxy+x(i)*y(i);
    sumx2=sumx2+x(i)*x(i);
end
xm=sumx/n;
ym=sumy/n;
a1=(n*sumxy-sumx*sumy)/(n*sumx2-sumx*sumx);
a0=ym-a1*xm;
for i=1:n
    st=st+(y(i)-ym)^2;
    sr=sr+(y(i)-a1*x(i)-a0)^2;
end
syx=(sr/(n-2))^0.5;
r2=(st-sr)/st;

a0
a1
syx
r2