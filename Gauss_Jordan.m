% solving the system of linear equations consist of more than 3 variables.
% using the Gauss elimination method.
% this algorithim includes three part which are forward elimination, back
% substition and pivoting.
% In this example demonstrates that how to solve four equations with four
% unknows using Gauss-Jordan method.
% 3x1 + 4x2 - 2x3 + 2x4 = 2
% 4x1 + 9x2 - 3x3 + 5x4 = 8
% -2x1 - 3x2 + 7x3 + 6x4 = 10
% x1 + 4x2 + 6x3 + 7x4 = 2
function [x]=gaussjordan(a)
a=[ 3  4 -2 2 2  
    4  9 -3 5 8 
   -2 -3  7 6 10 
    1  4  6 7 2];
[m,n]=size(a); % indicates the number of row and column

% Pivoting
for j= 1: m-1 % 1 ile m-1 arasýndaki tam sayýlar (bu örnekte 1 2 3 )
    for z=2:m % 2 ile m arasýndaki tam sayýlar (bu örnekte 2 3 4 )
        if a(j,j)==0  % eðer a(j,j) eþittir 0'a ise döngüye gir.
            t=a(j,:);
            a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
%convert the elements below the major diagonal to zeros
for i=j+1:m
    a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
 end
end


%convert the elements above the major diagonal to zeros
for j=m:-1:2
    for i=j-1:-1:1
    a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
 end
end

%convert the elements on the major diagonal to ones
for s=1:m
    a(s,:)=a(s,:)/a(s,s);
    x(s)=a(s,n);
    
end
% display the results
disp('Gauss-Jordan method:');
format
a
x'
