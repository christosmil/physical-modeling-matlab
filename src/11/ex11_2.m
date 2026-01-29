% Computes the time it takes Earth to be pulled by Sun, if suddenly Earth
% stopped orbiting.
% Precondition: n/a.
% Postcondition: the results have been plotted.

function res = ex11_2()
    % set the parameters
    X = [1.495978707e11, 0];
    day = 60*60*24;
    tspan = [0, 1000*day];

    % solve ODE
    options = odeset('Events', @event_func);
    [T, M] = ode45(@rate_func, tspan, X, options);

    % plot the results
    T = T / day;            % plot in days
    Y = M(:, 1) / 1000e6;   % plot in millions of km
    plot(T, Y);
    xlabel('Time (days)');
    ylabel('Earth - Sun Distance (million km)');

    % display final values
    T(end)
    M(end, :)
end

function res = rate_func(t, X)
    % unpack position and velocity
    y = X(1);
    v = X(2);

    % calculate derivatives
    dydt = v;
    dvdt = acceleration(t, X);

    % pack variables
    res = [dydt; dvdt];
end

function res = acceleration(t, X)
    m_e = 5.972168e24;      % earth mass in kg
    m_s = 1.9885e30;        % sun mass in kg
    grav = 6.674e-11;       % constant of gravitation in m^3 / (kg * s^2)

    f_g = -grav * m_e * m_s / X(1)^2;

    a_g = f_g / m_e;

    res = a_g;
end

function [value, isterminal, direction] = event_func(t, X)
    r_e = 6.3781e6;         % earth radius in m
    r_s = 695.700e6;        % sun radius in m

    y_final = r_s + r_e;
    
    value = X(1) - y_final;
    isterminal = 1;
    direction = -1;
end