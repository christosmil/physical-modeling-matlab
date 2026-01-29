% Computes the elements of the geometric sequence A(i+1) = A(i)/2.
% Precondition: n/a.
% Postcondition: the elements of the sequence have been stored to a vector.

A(1) = 1;
n = 10;
for iter=2:n
    A(iter) = A(iter-1)/2;
end