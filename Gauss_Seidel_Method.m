% solve the system of linear equations using Gauss-Seidel method:
% 3x1-0.1x2-0.2x3=7.85
% 0.1x1+7x2-0.3x3=-19.3
% 0.3x1-0.2x2+10x3=71.4
% initial values: x2=0, x3=0
% iterate until the value of error for x1 is less than 0.01%
% solutions:
% x1=(7.85+0.1x2+0.2x3)/3
% x2=(-19.3-0.1x1+0.3x3)/7
% x3=(71.4-0.3x1+0.2x2)/10

clear;clc;format ('long','g');
i=1;
x2(i)=0;x3(i)=0;
error_x1(i)=9999;
while error_x1(i)>=0.01
    x1(i+1)=(7.85+0.1*x2(i)+0.2*x3(i))/3;
    x2(i+1)=(-19.3-0.1*x1(i+1)+0.3*x3(i))/7;
    x3(i+1)=(71.4-0.3*x1(i+1)+0.2*x2(i+1))/10;
    
    error_x1(i+1)=abs((x1(i+1)-x1(i))/x1(i+1))*100;
    error_x2(i+1)=abs((x2(i+1)-x2(i))/x2(i+1))*100;
    error_x3(i+1)=abs((x3(i+1)-x3(i))/x3(i+1))*100;
    
    i=i+1;
end

disp('            x1           error(%)');
disp([x1',error_x1'])
disp('            x2           error(%)');
disp([x2',error_x2'])
disp('            x3           error(%)');
disp([x3',error_x3'])
