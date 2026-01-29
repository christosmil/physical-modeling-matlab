function res = exists_b(X)
    L = find(X>0);
    res = length(L) > 0;
end