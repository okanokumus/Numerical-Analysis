%{
  Title: Gaussian Elimination Method with Pivoting for Solving a Linear System
  Author: Cheuk Lau
  Date: 2/5/2014
  Description: This function solves a linear system Ax=b using the Gaussian
  elimination method with pivoting. The algorithm is outlined below:
    1) Initialize a permutation vector r = [1, 2,...,n] where r(i)
    corresponds to row i in A.
    2) For k = 1,...,n-1 find the largest (in absolute value) element among
    a(r(k),k),a(r(k+1),k),...,a(r(n),k).
    3) Assume r(j,k) is the largest element. Switch r(j) and r(k).
    4) For i=1,...,k-1,k+1,...,n calculate:
            zeta = a(r(i),k) / a(r(k),k)
    5) For j=k,...,n calculate:
            a(r(i),j)=a(r(i),j)-a(r(k),j)*zeta;
            b(r(i)) = b(r(i))-b(r(k))*zeta
    6) Steps 1 through 6 has effectively diagonalized A.
    7) Each element in the solution vector is:
            x(r(i)) = b(i)/a(i,i);
  Files required: (1) GAUSS_ELIM.m
  Reference: (1) http://mathworld.wolfram.com/GaussianElimination.html             
  Input parameters: A = n by n matrix in standard Matlab notation
                    b = n by 1 right-hand vector
  Output: x = computed solution
  Sample input:
        
        % We will set A as the Hilbert matrix:
        %       A(i, j) = 1 / (i + j - 1)
        % 
        % With the exact solution:
        %       x(i) = 1
        %
        % We can calculate the right-hand vector:
        %       b = Ax
        % 
        % By defining the exact solution we can then calculate a rate of 
        % error convergence. This method is known as the method of
        % manufactured solutions (MMS).

        % Assemble A-matrix  
        n=10; % You can change the dimension size if you want to look at
              % error convergence with input size
        A = zeros(n);
        for i = 1 : 1 : n    
            for j = 1 : 1 : n        
                A(i, j) = 1 / (i + j - 1);                           
            end    
        end
        
        % Exact solution -- used to calculate the error, if desired
        x_exact = ones(n, 1);
        
        % Assemble b-vector
        b = A*x_exact;         

  Output:        
        x = [1.0000
             1.0000
             1.0000
             1.0000
             0.9999
             1.0002
             0.9997
             1.0003
             0.9998
             1.0000]
%}

function x = GAUSS_ELIM(A, b)

%% Create permutation vector
n = size(A, 1);  % Size of input matrix
r = zeros(n, 1); % Initialize permutation vector
for i = 1 : 1 : n    
   r(i) = i;
end

%% Apply Gaussian elimination and rearrange permutation vector
x = zeros(n, 1); % Initialize solution vector
for k = 1 : 1 : n % Go through each element in permutation vector    
    % Compare each element in r(k)th column for the max
    max = abs(A(r(k), r(k)));    
    max_pos = k;    
    for l = k : 1 : n        
        if abs(A(r(l), r(k))) > max            
            max = abs(A(r(l), r(k)));            
            max_pos = l;            
        end
    end
    % Switch the kth r-vector element with max r-vector element
    temp_r = r;
    r(k) = temp_r(max_pos);
    r(max_pos) = temp_r(k);
    % Eliminate A-vector elements in r(k)th column below r(k)th row        
    for i = 1 : 1 : n
        if i ~= k
            zeta = A(r(i), k) / A(r(k), k);
            for j = k : 1 : n
                A(r(i), j) = A(r(i), j) - A(r(k), j) * zeta;                       
            end
            b(r(i)) = b(r(i)) - b(r(k)) * zeta;
        end
    end
end

% Compute the solution frpm the diagonalized A-matrix
for i = 1 : 1 : n
    x(i) = b(r(i)) / A(r(i), i);
end

end