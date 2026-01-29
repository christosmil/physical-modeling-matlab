% Computes the bikes in Boston and Cambridge at the end of each day.
% Precondition: you must assign values to b, c before running the script.
% Postcondition: the bikes at the end of each day have been calculated.

temp = b;
b = b*0.95 + c*0.03;
c = c*0.97 + temp*0.05;
round(b)
round(c)