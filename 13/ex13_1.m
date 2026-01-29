% Computes optimal angle and minimal velocity for the Green Monster.
% Precondition: n/a.
% Postcondition: n/a.

function res = ex13_1()
    thetas = linspace(0, pi/2);
    for iter=1:length(thetas)
        vertical_ranges(iter) = baseball_vertical_range(thetas(iter));
    end

    plot(thetas, rad2deg(vertical_ranges));
    xlabel('Launch angle (deg)');
    ylabel('Y position at x = 94.5m (m)');

end

function res = rate_func(t, W)
    % unpack position and velocity
    P = W(1:2);
    V = W(3:4);
    
    % compute the derivatives
    dPdt = V;
    dVdt = acceleration(t, P, V);

    % pack the derivatives
    res = [dPdt; dVdt];
end

function res = acceleration(t, P, V)
    g = 9.8;        % gravitational acceleration in m / s^2
    a_g = [0; -g];

    m = 0.145;      % mass in kg
    a_d = drag_force(V) / m;

    res = a_d + a_g;
end

function res = drag_force(V)
    C_d = 0.3;      % dimensionless
    rho = 1.3;      % kg / m^3
    A = 0.0042;     % m^2;
    v = norm(V);    % m/s

    res = -1/2 * C_d * rho * A * v * V;
end

function [value, isterminal, direction] = event_func(t, W)
    value = W(2);
    isterminal = 1;
    direction = -1;
end

function res = baseball_vertical_range(theta)
    P = [0; 1];     % initial position in m
    v = 50;
    [vx, vy] = pol2cart(theta, v);

    V = [vx; vy];   % initial velocity in m/s
    W = [P; V];     % initial condition

    tspan = [0 10];
    options = odeset('Events', @event_func);
    [T, M] = ode45(@rate_func, tspan, W, options);

    res = M(end, 2);
end