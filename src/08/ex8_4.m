% res = ex8_4(X)
% Checks whether all vector elements are positive, using the find function.
% Precondition: n/a.
% Postcondition: returns 1 if all positive, else 0.

function res = ex8_4(X)
    L = find(X<=0);
    res = length(L) == 0;
end