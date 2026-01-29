% Computes the ratio between consecutive elements of fibonacci series.
% Precondition: you must assign values to n before running the script.
% Postcondition: the ratio has been plotted and converges to a constant.

F(1) = 1;
F(2) = 1;
for iter=3:n
    C(iter-2) = F(iter-1)/F(iter-2);
    F(iter) = F(iter-1) + F(iter-2);
end

plot(C);