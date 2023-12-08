function [En_meV, wn] = EnergyFrequency(meff, L, n)
load('constants.mat', 'hbar', 'm0', 'J2eV')
En_J = (hbar * pi * n / (L * 1e-9)).^2 ./ (2 * meff * m0);
En_meV = En_J * J2eV * 1e3;
wn = En_J / hbar;
disp(['For an electron meff = ', num2str(meff), ', in L = ', num2str(L), ' nm: '])
fprintf('E%li = %3i meV; w%li = %1.0e rad/s\n', [n; round(En_meV); n; wn])
end