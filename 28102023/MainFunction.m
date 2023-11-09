clc, clear, close all
load 'constants.mat'

%% Handle-functions

Energy = @ (n, L, meff) (hbar * pi * n / (L * 1e-9))^2 / (2 * meff * m0) * J2eV * 1e3;

%% Ex.1 Analythical solve
% In ex.1 we need to compare analythical and numeric solves
% for n = 1, 2, 3 by plotting.

figure('Name', 'Analythical solve')
hold on
L = 98;
h = 1;
for n = 1:3
    for x = 1:L
        for y = 1:L
            Psin(x, y) = (2 / L) * (sin(pi * n * x / L)) * (sin(pi * n * y / L));
        end
    end
    nexttile
    surf(1:L, 1:L, Psin)
    title(strcat('Analythical solve, n= ', num2str(n)))
end
hold off

%% Ex.1 Numeric solve

figure('Name', 'Numeric solve')
N = 98;
I = eye(N, N);
T = I;
for i = 1:N
    for j = 1:N
        if i == j
            T(i, j) = 4;
            continue
        end
        if i == j - 1 || i == j + 1 || i == j - 5 || i == j + 5
            T(i, j) = -1;
        end
    end
end
[psi, D] = eig(T);
psi = psi ./ sqrt(h);

for n = 1:3
    vals = psi(:, n);
    for x = 1:L
        for y = 1:L
            psi_r(x, y) = vals(x) * vals(y);
        end
    end
    nexttile
    surf(1:L, 1:L, psi_r)
    title(strcat('Numeric solve, n= ', num2str(n)))
end

%% Ex.2 abs(psi)^2 (Analythical solve)
% In ex.2 we need the same thing we had in ex.1 but for abs(psi)^2

figure('Name', 'abs(psi)^2 (Analythical solve)')
hold on
for n = 1:3
    for x = 1:L
        for y = 1:L
            Psin(x, y) = (2 / L) * (sin(pi * n * x / L)) * (sin(pi * n * y / L));
        end
    end
    nexttile
    surf(1:L, 1:L, abs(Psin).^2)
    title(strcat('|psi|^2 (Analythical solve), n= ', num2str(n)))
end
hold off

%% Ex.2 abs(psi)^2 (Numeric solve)

figure('Name', 'abs(psi)^2 (Numeric solve)')
for n = 1:3
    vals = psi(:, n);
    for x = 1:L
        for y = 1:L
            psi_r(x, y) = abs(vals(x) * vals(y))^2;
        end
    end
    nexttile
    surf(1:L, 1:L, psi_r)
    title(strcat('|psi|^2 (Numeric solve), n= ', num2str(n)))
end

%% Ex.3 E~n An. and Num. solves
% In ex.3 we need to compare analythical and numeric connection
% between E and n by plotting. Also we need to try high n values
% (n = 10, 50, 90)

figure('Name', 'E~n Num. and An. solves')
En = hbar^2 * diag(D) / (h^2 * 2 * m0);
for n = 1:98
    Ea(n) = Energy(n, 98, 0.07);
end
En = En./En(1);
Ea = Ea./Ea(1);
hold on
plot(1:98, En, 1:98, Ea)
legend('Numeric', 'Analythical')
title('E~n Num. and An. solves')
hold off

%% Ex. 4 An. and Num. solves for n >> 10
% In ex.4 we need the same thing we had in ex.1 but for
% n >> 10 (for example, n = 50)

figure('Name', 'Analythical solve n >> 10')
L = 98;
h = 1;
n = 10;
for x = 1:L
    for y = 1:L
        Psin(x, y) = (2 / L) * (sin(pi * n * x / L)) * (sin(pi * n * y / L));
    end
end
surf(1:L, 1:L, Psin)
title('Analythical solve n >> 10')

figure('Name', 'Numeric solve n >> 10')
vals = psi(:, n);
    for x = 1:L
        for y = 1:L
            psi_r(x, y) = vals(x) * vals(y);
        end
    end
    surf(1:L, 1:L, psi_r)
title('Numeric solve n >> 10')

%% Ex. 5 (Advanced) En ~ n by numeric solve
% In ex.5 we need to find out dependence of numeric En from n
% by plotting.

figure('Name', 'En ~ n by numeric solve')
n = 1:10;
E = hbar^2 * diag(D) / (h^2 * 2 * m0);
plot(n, E(1:10))
title('En ~ n by numeric solve')

datetime(clock)