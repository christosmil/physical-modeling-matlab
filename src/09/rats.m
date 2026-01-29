function res = rats()
    t = 365/2;
    y = 1000;
    res = rate_func(t, y);

    [T, Y] = ode45(@rate_func, [0, 365], 1000);
    plot(T, Y)
end

function res = rate_func(t, y)
    a = 0.002;
    omega = 2*pi / 365;
    res = a * y * (1 - cos(omega*t));
end