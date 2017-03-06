% solving the system of linear equations consist of more than 3 variables.
% using the Gauss elimination method.
% this algorithim includes three part which are forward elimination, back
% substition and pivoting.
% In this example demonstrates that how solve four equations with four
% unknows using Gauss elimination method.
% 3x1 + 4x2 - 2x3 + 2x4 = 2
% 4x1 + 9x2 - 3x3 + 5x4 = 8
% -2x1 - 3x2 + 7x3 + 6x4 = 10
% x1 + 4x2 + 6x3 + 7x4 = 2
function [x]=gausselim(a)
a=[ 3  4 -2 2 2  
    4  9 -3 5 8 
   -2 -3  7 6 10 
    1  4  6 7 2];
[m,n]=size(a); % indicates the number of row and column

% Pivoting
% the first row of a matrix is called as pivot equation and first element  is
% called pivot coefficient.
% The procedure can be continued using the remaining pivot equations. The final manipulation
% in the sequence is to use the (n-1)th equation to eliminate the X(n-1) term
% from the nth equation. At this point, the system will have been transformed to an upper
% triangular system
for j= 1: m-1 % 1 ile m-1 arasýndaki tam sayýlar (bu örnekte 1 2 3 )
    for z=2:m % 2 ile m arasýndaki tam sayýlar (bu örnekte 2 3 4 )
        if a(j,j)==0  % eðer a(j,j) eþittir 0'a ise döngüye gir.
            t=a(j,:);
            a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
% convert the elements below the major diagonal to zeros
% forward elemination: The first phase is designed to reduce the set of
% equations to an upper triangular system. Multiple by A(2,1)/A(1,1) to the
% A(1,:) and mines to the A(2,:) and we eleminate the X1.
for i=j+1:m
    a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
 end
end
x=zeros(1,m); % 1 satýrlýk ve m sütunluk 0 matrisi üretir

%back substitution
for s=m:-1:1
    sum=0;
    for k=2:m
        sum=sum+a(s,k)*x(k);
    end
    x(s)=(a(s,n)-sum)/a(s,s);
end
% display the results
disp('Gauss elimination method:');
format short;
a
x'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Pseudocode to perform; forward elimination
% DOFOR k = 1, n-1
% DOFOR i=k+1, n
% factor=ai,k / ak,k
% DOFOR j=k + 1 to n
% ai,j = ai,j - factor . ak,j
% END DO
% bi = bi - factor . bk
% END DO
% END DO

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Pseudocode to perform; back substitution
% xn = bn / an,n
% DOFOR i= n-1,1, -1
% sum=bi
% DOFOR j=i + 1 , n
% sum = sum - ai,j . xj
% END DO
% xi = sum /ai,j
% END DO

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%