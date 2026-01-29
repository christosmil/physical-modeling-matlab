% Calculates the elements of the sequence 1/(2^i) up to the tenth element.
% Precondition: n/a.
% Postcondition: The tenth element has been stored to variable a.

a1 = 1
for iter=2:10
    a = a1 / (2^(iter-1))
end