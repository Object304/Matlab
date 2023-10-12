clc, clear, close;

%Task1

h = 6.6261 * 10^-34;
m = 1;
v = 1;
p = m * v;
lambda1 = h / p

%Task2

m0 = 0.911 * 10^-30;
e = [1*1.6*10^-19; 10000*1.6*10^-19];
lambda2 = [h/sqrt(2*m0*e(1))*10^9; h/sqrt(2*m0*e(2))*10^9]

%Task3

e1 = 54 * 1.6 * 10^-19 * 10^-3;
meff = 0.067 * m0;
h1 = 1.0546 * 10^-34;
lambda3 = 2 * pi * h1 / sqrt(2 * e1 * meff)

datestr(clock)