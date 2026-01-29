% Computes the logistic map.
% Precondition: n/a.
% Postcondition: the logistic map has been plotted.

clear X;

X(1) = 0.5;
r = 2.9;

for iter=1:19
    X(iter+1) = r * X(iter) * (1 - X(iter));
end

plot(X)