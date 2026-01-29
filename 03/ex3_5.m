% Computes the total fudges if for each fudge I give as an extra a quarter
% of the previous extra, with starting bonus being 1/4.
% Precondition: you must assign value to n before running the script.
% Postcondition: total fudges are stored to the ans variable.

A1 = 1;
total = 0;
r = 1/4;

for iter=2:n
    a = A1 + r^iter;
    total = total + a;
end
ans = total