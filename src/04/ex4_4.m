% Computes the Lorenz attractor.
% Precondition: n/a.
% Postcondition: the Lorenz attractor has been plotted in three dimensions.

clear all;

X(1) = 1;
Y(1) = 2;
Z(1) = 3;

sigma = 10;
b = 8/3;
r = 28;
dt = 0.01;

for iter=1:10000
    X(iter+1) = X(iter) + sigma*(Y(iter) - X(iter))*dt;
    Y(iter+1) = Y(iter) + (X(iter)*(r - Z(iter)) - Y(iter))*dt;
    Z(iter+1) = Z(iter) + (X(iter)*Y(iter) - b*Z(iter))*dt;
end

plot3(X, Y, Z);
comet3(X, Y, Z);