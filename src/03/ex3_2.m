% Plots the bikes in Boston and Cambridge at the end of each day.
% Precondition: n/a.
% Postcondition: the bikes at the end of each day have been plotted.

b = 100;
c = 100;
clf;
hold on;
plot(0, b, 'ro');
plot(0, c, 'bd'); 
for iter=1:30
    bike_update
    plot(iter, b, 'ro');
    plot(iter, c, 'bd');
end
hold off;