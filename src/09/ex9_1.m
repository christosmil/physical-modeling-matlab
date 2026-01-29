% Calculate time needed until coffee is drinking.
% Precondition: n/a
% Postcondition: the results have been plotted.

function res = ex9_1()
    t = 0;
    y0 = 90;
    dy = rate_func(t, y0);

    [T Y] = ode45(@rate_func, [0:60], y0);
    plot(T, Y);
    xlabel("Time (minutes)");
    ylabel("Coffee temperature (\circC)");
    saveas(gcf, 'coffee.eps', 'epsc');
end

function res = rate_func(t, y)
    k = 0.01;
    e = 20;

    res = -k * (y - e);
end