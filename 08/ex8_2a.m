% res = ex8_2a(X)
% Computes the cumulative ratio of a vector using loop.
% Precondition: n/a.
% Postcondition: the result has been stored to vector res.

function res = ex8_2a(X)
    Y(1) = X(1);
    for iter=2:length(X)
        Y(iter) = X(iter) / X(iter-1);
    end
    res = Y;
end