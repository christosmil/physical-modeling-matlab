# Errata

## Physical Modeling in MATLAB, *v4.0*
The following list contains the errata found in *v4.0* of the book. The list is in pages ascending order.

1. p007: single quotes is char array, double quotes is string
2. p041: "If you had any trouble with , you have to..." -> "If you had any trouble with Exercise 3.5, you have to..."
3. p065: In the solutions in [GitHub](https://github.com/AllenDowney/PhysicalModelingInMatlab/blob/master/code/chap06/fib_triple.m), in line 14, it should be
```
if hypotenuse(a, b) == c
```
4. p076: In the solutions in [GitHub](https://github.com/AllenDowney/PhysicalModelingInMatlab/blob/master/code/chap07/duck.m), in line 10, it should be
```
mass_duck = 4/3 * pi * r.^3 * rho;
```
5. p087: "In the previous chapter..." -> "In a previous chapter..."
6. p087: "...a program for Section 7.2" -> "...a program for Exercise 7.2"
7. p089: "If it related derivatives..." -> "If it relates derivatives..."
8. p106: "[drdt; dfdt]" -> "[dxdt; dydt]"
9. p109: Figure needs the following command for the x-axis.
```
tspan = [0, 25];
```
10. p128: The graph is probably wrong, dute to inverse vertical (40m/s instead of 30m/s) and horizontal (30m/s instead of 40m/s) initial velocities.
11. p135: "In in the previous chapter..." -> "In the previous chapter..."
12. p137: The axes' labels in Figure 13.1 are the opposite.
13. "W = [0 1 30 40]" -> "W = [0 1 40 30]"