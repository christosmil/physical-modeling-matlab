% Solves the differential equations of a Lorenz system.
% Precondition: n/a.
% Postcondition: the solutions have been plotted.

function res = ex10_2()
    % set the parameters
    t = 0;
    x = 1;
    y = 2;
    z = 3;
    tspan = [0, 30];

    % test the rate function
    % res = rate_func(t, [x; y; z]);

    % solve ODE
    [T, M] = ode45(@rate_func, tspan, [x y z]);

    % plot the results with respect to time
    X = M(:, 1);
    Y = M(:, 2);
    Z = M(:, 3);
    figure;
    hold on;
    plot(T, X, '-');
    plot(T, Y, '--');
    plot(T, Z, '-.');
    hold off;
    xlabel('Time (minutes)');
    ylabel('Atmospheric Convection');
    legend('rate of convection, x', ...
        'horizontal temperature variation, y', ...
        'vertical temperature variation, z');

    % phase plot the trajectory
    figure;
    plot3(X, Y, Z);
    xlabel('rate of convection');
    ylabel('horizontal temperature variation');
    zlabel('vertical temperature variation');

    % phase plot animated
    % figure; comet3(X, Y, Z);
end

function res = rate_func(t, V)
    % unpack the elements of V
    x = V(1);
    y = V(2);
    z = V(3);

    % set the parameters
    sigma = 10;
    b = 8/3;
    r = 28;

    % calculate the derivatives
    dxdt = sigma*(y - x);
    dydt = x*(r - z) - y;
    dzdt = x*y - b*z;

    % pack the results
    res = [dxdt; dydt; dzdt];

end