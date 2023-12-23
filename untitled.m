clc, clear, close all
NN = 250;             % Number of points in the problem space.
hbar = 1.054e-34;     % Plank's constant
m0 = 9.1e-31;         % Free space mass of an electron
meff = 1.0;           % Effective mass: Si is 1.08, Ge is 0.067, GaAs is 0.55
melec = meff*m0;      % Mass of an electron
eV2J = 1.6e-19;       % Energy conversion factors
J2eV = 1/eV2J;
Energy = @ (n, L, meff) (hbar * pi * n / (L * 1e-9))^2 / (2 * meff * m0) * J2eV * 1e3;

% Energy levels

meff = 1;



figure
L = 20;
for n = 1:4
    E(n) = Energy(n, L, meff);
end
plot([0 L], [E(1) E(1)],[0 L], [E(2) E(2)],[0 L], [E(3) E(3)],[0 L], [E(4) E(4)]);