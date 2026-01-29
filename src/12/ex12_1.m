% Computes the effects of less air density in the baseball model.
% Precondition: n/a.
% Postcondition: the results have been plotted.

function res = ex12_1()
    % close all open figures
    close all;

    % set the parameters
    P = [0; 1];     % initial position in m
    V = [40; 30];   % initial velocity in m/s
    W = [P; V];     % initial conditions
    tspan = [0 6];

    % solve ODE
    options = odeset('Events', @event_func);
    [T, M] = ode45(@rate_func, tspan, W, options);

    % unpack the derivatives
    P = M(:, 1:2);
    V = M(:, 3:4);
    X = P(:, 1);
    Y = P(:, 2);

    % plot the results
    hold on;
    plot(T, X);
    plot(T, Y);
    hold off;
    xlabel('Time (s)');
    ylabel('Position (m)');
    legend('X position', 'Y position', 'Location', 'northwest');

    % display the final values
    X(end)
    Y(end)
    V(end, :)
end

function res = rate_func(t, W)
    % unpack position and velocity
    P = W(1:2);
    V = W(3:4);

    % compute the derivatives
    dPdt = V;
    dVdt = acceleration(t, P, V);

    % pack the derivatives into a column vector
    res = [dPdt; dVdt];
end

function res = acceleration(t, P, V)
    m = 0.145;          % mass in kg
    g = 9.8;            % gravitational acceleration in m / s^2
    a_g = [0; -g];

    a_d = drag_force(V) / m;
        
    res = a_g + a_d;
end

function res = drag_force(V)
    rho = 1.01;         % air density in kg / m^3
    v = norm(V);        % magnitude of velocity in m/s
    c_d = 0.3;          % drag coefficient; dimensionless
    a = 0.0042;         % cross-sectional area in m^2

    res = -1/2 * rho * v * c_d * a * V;
end

function [value, isterminal, direction] = event_func(t, W)
    value = W(2);
    isterminal = 1;
    direction = -1;
end