% Calculates the series 1/(2^i) up to the tenth element.
% Precondition: n/a.
% Postcondition: The sum of the series has been stored to ans.

a = 1;
total = a;

for iter=2:10
    a = a/2;
    total = total + a;
end
ans = total