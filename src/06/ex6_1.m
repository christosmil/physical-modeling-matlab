% res = ex6_1(n)
% Finds Pythagorean triples using the first 'n' Fibonacci numbers.

function ex6_1(n)
    F(1) = 1;
    F(2) = 1;
    for iter=3:n
        F(iter) = F(iter-1) + F(iter-2);
    end
    
    for iter=1:n-3
        a = F(iter) * F(iter+3);
        b = 2 * F(iter+1) * F(iter+2);
        c = F(iter+1)^2 + F(iter+2)^2;
        if is_pythagorean(a, b, c)
            disp([a, b, c])
        end
    end
end