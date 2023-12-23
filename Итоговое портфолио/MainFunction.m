clc, clear, close all
load constants.mat 

% Handle-functions

Energy = @ (n, L, meff) (hbar * pi * n / (L * 1e-9))^2 / (2 * meff * m0) * J2eV * 1e3;

% Energy levels

figure
hold on
meff = 0.07;
L = 10;
E1 = Energy(1, L, meff);
for n = 1:3
    E = Energy(n, L, meff);
    x = [-L / 2; L / 2];
    y = [E / E1; E / E1];
plot(x, y)
end
Plot(gca, L, 1);
hold off

% Solve

figure
hold on
L = 10;
x = -L/2:0.1:L/2;
for n = 1:3
    Psin = sqrt(2 / L) * (sin(pi * n * x / L + pi * n / 2));
    plot(x, Psin)
end
Plot(gca, L, 0);
hold off

datetime(clock)