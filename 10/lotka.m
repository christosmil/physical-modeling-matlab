function res = lotka()
    t = 0;
    V_init = [80, 20];
    rate_func(t, V_init)

    tspan = [0, 200]
    [T, M] = ode45(@rate_func, tspan, V_init)
%     plot(T, M)

    R = M(:, 1);
    F = M(:, 2);
    size(R)
    size(F)
    hold on;
    plot(T, R, '-');
    plot(T, F, '--');
    hold off;
    xlabel('Time (weeks)');
    ylabel('Population');
    legend('Rabbits', 'Foxes');
    
    figure;
    plot(R,F);
    xlabel('Rabbit population');
    ylabel('Fox population');
end

function res = rate_func(t, V)
    % unpack the elements of V
    x = V(1);
    y = V(2);

    % set the parameters
    a = 0.1;
    b = 0.01;
    c = 0.1;
    d = 0.002;

    % compute the derivatives
    dxdt = a*x - b*x*y;
    dydt = -c*y + d*x*y;

    % pack the derivatives into a vector
    res = [dxdt; dydt];
end