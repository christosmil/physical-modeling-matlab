% Computes the descent of a skydiver.
% Precondition: n/a.
% Postcondition: the result have been plotted.

function res = ex11_1()
    % set the parameters
    t = 0;
    X = [4000, 0];
    tspan = [0, 1000];
    
    % solve ODE
    options = odeset('Events', @event_func);
    [T, M] = ode45(@rate_func, tspan, X, options);

    % unpack the derivatives
    Y = M(:, 1);

    % plot the results
    plot(T, Y);
    xlabel('Time (s)');
    ylabel('Altitude (m)');

    % display final values
    T(end)
    M(end, :)
end

function res = rate_func(t, X)
    % unpack position and velocity
    y = X(1);
    v = X(2);

    % compute the derivatives
    dydt = v;
    dvdt = acceleration(t, X);

    % pack the derivatives into a column vector
    res = [dydt; dvdt];
end

function [value, isterminal, direction] = event_func(t, X)
    value = X(1);
    isterminal = 1;
    direction = -1;
end

function res = acceleration(t, X)
    if X(1) >= 7.7
        b = 0.2;                % drag constant for free fall in kg/m
    else
        b = 29;                 % drag constant for parachute in kg/m
    end
    v = X(2);                   % velocity in m/s
    f_d = -sign(v) * b * v^2;   % drag force in N

    m = 75;                     % mass in kg
    a_d = f_d / m;              % drag acceleration in m/s^2

    a_g = -9.8;                 % gravity acceleration in m/s^2

    res = a_d + a_g;
end