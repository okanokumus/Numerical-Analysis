function [L,U]= LUdecompcrout(A)
%the function decomposes the matrix A into a lower triangular matrix L
% and an upper triangular matrix U, using Crout's method 
%such that A=LU.
% Input variable:
% A the matrix of coefficients.
% Output variables:
% L lower triangular
% U upper triangular

[m,n]=size(A);
for i=1:m
    L(i,1)=A(i,1);
    U(i,i)=1;
end
for j=2:m
    U(1,j)=A(1,j)/L(1,1); % L(1,1) ile A (1,1) ayný þeyi ifade ediyor
end
for i=2:m
    for j=2:i
        L(i,j)=A(i,j)-L(i,1:j-1)*U(1:j-1,j);
    end
    for j=i+1:m
        U(i,j)=(A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
    end
end
% when you write on the command window you do not forget in [L,U]= LUdecompcrout(A)
% form.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pseudocode of the LU decomposition

% SUB Decompose (a, n)
% DOFOR k 5 1, n 2 1
% DOFOR i 5 k 1 1, n
% factor 5 ai,k/ak,k
% ai,k 5 factor
% DOFOR j 5 k 1 1, n
% ai,j 5 ai,j 2 factor * ak,j
% END DO
% END DO
% END DO
% END Decompose%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%