% Computes the first n-th elements of a fibonacci sequence.
% Precondition: the value of n.
% Postcondition: stores the n-th sequence element in ans.

f1 = 1;
f2 = 1;
f_new = 1;

for iter=3:n
    f_new = f1 + f2;
    f1 = f2;
    f2 = f_new;
end
ans = f_new