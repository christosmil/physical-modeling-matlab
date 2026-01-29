% res = ex8_3(X)
% Checks whether all vector elements are positive.
% Precondition: n/a.
% Postcondition: returns 1 if all positive, else 0.

function res = ex8_3(X)
    for iter=1:length(X)
        if X(iter) <= 0
            res = 0;
            return
        end
    end
    res = 1;
end