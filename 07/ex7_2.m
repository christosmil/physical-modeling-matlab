% res = ex7_2(d)
% Error function for a floating duck's body that is submerged.
% Precondition: n/a.
% Postcondiotion: the error has been calculated.

function res = ex7_2(d)
    rho = 0.3;  % density in g / cm^3
    r = 10;     % radius in cm
    
    mass_water = pi/3 * (3.* r*d.^2 - d.^3);
    mass_duck = 4/3 * pi * r.^3 * rho;
    res = mass_water - mass_duck;
end