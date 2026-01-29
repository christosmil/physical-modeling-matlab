function res = baseball2()
    [x, fval] = fminsearch(@min_func, pi/4);
    res = [x; fval];

    tspan = 0:0.1:10;
    W = [0 1 40 30];
    options = odeset('Events', @event_func);
    [T, M] = ode45(@rate_func, tspan, W, options);
    animate(T, M);
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
    C_d = 0.3;              % dimensionless
    rho = 1.3;              % kg / m^3
    A = 0.0042;             % m^2;
    v = norm(V);            % m/s

    res = -1/2 * C_d * rho * A * v * V;
end

function [value, isterminal, direction] = event_func(t, W)
    value = W(2);
    isterminal = 1;
    direction = -1;
end

function res = baseball_range(theta)
    P = [0; 1];             % initial position in m
    v = 50;
    [vx, vy] = pol2cart(theta, v);

    V = [vx; vy];           % initial velocity in m/s
    W = [P; V];             % initial condition

    tspan = [0 10];
    options = odeset('Events', @event_func);
    [T, M] = ode45(@rate_func, tspan, W, options);

    res = M(end, 1);
end

function res = min_func(angle)
    res = -baseball_range(angle);
end

function animate(T, M)
    X = M(:, 1);
    Y = M(:, 2);

    minmax = [min([X]), max([X]), min([Y]), max([Y])];

    for i=1:length(T)
        clf; hold on;
        axis(minmax);
        plot(X(i), Y(i), 'o');
        drawnow;

        if i < length(T)
            dt = T(i+1) - T(i);
            pause(dt);
        end
    end
end