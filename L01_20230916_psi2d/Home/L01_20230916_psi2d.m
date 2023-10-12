clc, clear, close;

syms A x a b;

% source function
f = A*exp(-x^2/a^2 + 1i*b*x);
% my real part
f1 = A*exp(-x^2/a^2)*cos(b*x);
% gauss = (A*exp(-x^2/a^2)*cos(b*x))^2 + (A*exp(-x^2/a^2)*sin(b*x))^2;
gauss_simple = (A*exp(-x^2/a^2))^2;

A = 5;
b = 2 * pi * 4 / 5;
a = sqrt(2 * (7 / 6)^2);

x = -5:0.084:5;

% plot from my real part
y1 = subs(f1);

% plot using real()
y = subs(f);
y2 = real(y);

yg = subs(gauss_simple);

figure1 = figure;
plot(x, y1, 'b', x, y2, 'r.');
title('$\Re \left[ \Psi(x,0) = A \exp \left( -\frac{x^2}{a^2} + \imath bx \right) \right]$','Interpreter','latex')
xlabel('x');
ylabel('Analytical $\Re(\Psi)$ \& real($\Psi$)','Interpreter','latex');
legend('$\Re(\Psi)$','real($\Psi$)','Interpreter','latex');

figure2 = figure;
plot(x, y1, 'b', x, y2, 'r.', x, yg, 'g', x, yg, '.');
title('Real part $\Psi$ and $|\Psi|^2$','Interpreter','latex')
xlabel('x');
ylabel('Re($\Psi$) and $|\Psi|^2$','Interpreter','latex');
legend('$\Re(\Psi)$=','real($\Psi$)','$|\Psi|^2$=','$\left(A*exp\left(\frac{-x^2}{a^2}\right)\right)^2$','Interpreter','latex');

datetime(clock)