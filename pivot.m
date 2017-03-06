function R = pivot(A, r, c)
[m, n] = size(A); % Get matrix dimensions
R = zeros(m, n); % Initialize to appropriate size
R(r,:) = A(r, :) / A(r,c); % Copy row r, normalizing M(r,c) to 1
for k = 1:m % For all matrix rows
if (k ~= r) % Other then r
R(k,:) = A(k,:) ... % Set them equal to the original matrix
- A(k,c) * R(r,:); % Minus a multiple of normalized row r, making R(k,c)=0
end
end
end


%With this function defined, we can perform the identical operation as above:
%A = [1 2 3; 2 3 4]; B = pivot(A, 1, 1);
%which we set B equal to: [1 2 3 ; 0 -1 -2]

