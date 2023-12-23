clc, clear, close all
load('constants.mat')

deltaEnergy = @ (meff, L, n) round((hbar * pi / (L * 1e-9))^2 / (2 * meff * m0) * J2eV * 1e3 * (2 * n + 1));

fprintf('deltaE%i = %i meV\n', [12; deltaEnergy(0.07, 10, 1)]);
fprintf('deltaE%i = %i meV\n', [23; deltaEnergy(0.07, 10, 2)]);

% n = 1
Lmax = @ (meff, T) round(hbar * pi * sqrt((2 * 1 + 1) / (3 * meff * 1.38e-23 * m0 * T)) * 10^9);

fprintf('For practical systems\n(meff = %.2f, T = %d K):\nLmax = %d nm\n', [0.07; 300; Lmax(0.07, 300)])

datetime(clock)