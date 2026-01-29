function res = euler()
    T(1) = 0;
    Y(1) = 5;
    dt = 0.1;
    
    for i=1:40
        r = rate_func(T(i), Y(i));
        T(i+1) = T(i) + dt;
        Y(i+1) = Y(i) + r*dt;
    end
    hold on;
    plot(T, Y)
    [T, Y] = ode45(@rate_func, [0, 4], 5);
    plot(T, Y, '--')
    hold off;
    xlabel('Time (hours)')
    ylabel('Population (billions of cells)')
    legend('euler', 'ode45', 'Location', 'northwest')
    saveas(gcf, 'runge.eps', 'eps')
end

function res = rate_func(t, y)
    a = 0.2;
    dydt = a * y;
    res = dydt;
end