function res = baseball()

    thetas = linspace(0, pi/2);
    for i=1:length(thetas)
        ranges(i) = baseball_range(thetas(i));
    end
    
    plot(thetas, ranges);
    xlabel('Launch angle (rad)');
    ylabel('Distance traveled (m)');
end

function res = rate_func(t, W)
    P = W(1:2);
    V = W(3:4);

    dPdt = V;
    dVdt = acceleration(t, P, V);

    res = [dPdt; dVdt];
end

function res = acceleration(t, P, V)
    g = 9.8;                % acceleration due to gravity in m/s^2
    a_gravity = [0; -g];

    m = 0.145;              % mass in kg
    a_drag = drag_force(V) / m;

    res = a_gravity + a_drag;
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

function res = baseball_range(theta)
    P = [0; 1];     % initial position in m
    v = 50;
    [vx, vy] = pol2cart(theta, v);

    V = [vx; vy];   % initial velocity in m/s
    W = [P; V];     % initial condition

    tspan = [0 10];
    options = odeset('Events', @event_func);
    [T, M] = ode45(@rate_func, tspan, W, options);

    res = M(end, 1);
end