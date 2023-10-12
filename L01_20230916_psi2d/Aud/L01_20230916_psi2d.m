clc, clear, close;

syms A x a b x1;

% исходная функция
f1 = A*exp(-x^2/a^2 + 1i*b*x);
% моя действ. часть
f2 = A*exp(-x1^2/a^2)*cos(b*x1);
gauss = (A*exp(-x^2/a^2)*cos(b*x))^2 + (A*exp(-x^2/a^2)*sin(b*x))^2;

%% работа с переменными

A = 5;
x = -5:0.01:5;
x1 = -5:0.1:5;
b = 2 * pi * 4 / 5;
a = sqrt(2 * (7 / 6)^2);

y1 = subs(f1);
y2 = subs(f2);
yg = subs(gauss);

%% построения

nexttile
plot(x, y1, 'b', x1, y2, 'r.');
title('f1')

nexttile
plot(x, y1, 'b', x1, y2, 'r.', x, yg);
title('fg')

datetime(clock)