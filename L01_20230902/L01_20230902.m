clc, clear, close;

h = 6.63 * 10^-34
m = 1
v = 1
p = m * v
lambda = h / p;
Task1 = lambda

m0 = 0.911 * 10^-30
e = [1*1.6*10^-19; 10000*1.6*10^-19]
lambda1 = [h/sqrt(2*m0*e(1))*10^9; h/sqrt(2*m0*e(2))*10^9];
Task2 = lambda1

e1 = 54 * 1.6 * 10^-19 * 10^-3
meff = 0.067 * m0
h1 = 1.0546 * 10-34

datestr(clock)