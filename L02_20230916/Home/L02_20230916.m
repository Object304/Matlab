clear, clc, close;
syms x y;
s = solve(x^2+(y*5/4-sqrt(abs(x)))^2 == 1, y);
x = -1:0.01:1;
y = subs(s);

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple line objects using matrix input to plot
plot(x, y,'LineWidth',3,'Color',[1 0 0]);
fill(x, y, 'b')

% Create ylabel
ylabel('Y');

% Create xlabel
xlabel('X');

% Create title
txt = '$x^2+\left(\frac{5y}{4}-\sqrt{|x|}\right)^2 = 1$';
title(txt,'Interpreter','latex');

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'FontAngle','italic','XColor',[0 0 0],'XGrid','on','YColor',[0 0 0],'YGrid',...
    'on','ZColor',[0 0 0], Layer = 'top');


figure2 = figure;

% L
subplot(2,2,1)
x = 0:0.1:3;
y = 1./x;
plot(x, y);
txt = '$y = \frac{1}{x}$';
title(txt,'Interpreter','latex');

% O
subplot(2,2,2)
syms x y;
s2 = solve(x^2 + y^2 == 9, y);
x = -3:0.1:3;
y = subs(s2);
plot(x, y);
txt = '$x^2 + y^2 = 9$';
title(txt,'Interpreter','latex');

% V
subplot(2,2,3)
x = -5:0.1:5;
y = abs(-2*x);
plot(x, y);
txt = '$y = |-2x|$';
title(txt,'Interpreter','latex');

% E
subplot(2,2,4)
y = -pi:0.01:pi;
x = -3 * abs(sin(y));
plot(x, y);
txt = '$x = -3|\sin(y)|$';
title(txt,'Interpreter','latex');

datetime(clock)
