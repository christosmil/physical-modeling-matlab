% res = ex8_2b(X)
% Computes the cumulative ratio of a vector using e-based formula.
% Precondition: n/a.
% Postcondition: the result has been stored to vector res.

function res = ex8_2b(X)
    Y(1) = X(1);
    for iter=2:length(X)
        Y(iter) = X(iter-1);
    end
    res = exp(log(X) - log(Y));
end