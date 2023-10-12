function [gca] = Plot(gca, L, key)
if key == 0
    yt = get(gca,'YTick');
    set(gca,'YTickLabel', sprintf(' ',yt))
    xt = get(gca,'XTick');
    set(gca,'XTickLabel', sprintf(' ',xt))
    xlim([-5, 10])
    ylim([-(2/L)^(1/2), (2/L)^(1/2)])
    ylabel('Wave function, $\psi_{n}(x)$', 'Interpreter', 'latex')
    
    text(-2.6613, -0.0357, '$\psi_{1}$', 'Interpreter', 'latex')
    text(0.265, -0.0270, '$\psi_{2}$', 'Interpreter', 'latex')
    text(3.6521, 0.0896, '$\psi_{3}$', 'Interpreter', 'latex')
    
    % x
    
    text(-(L / 2) - 0.8, -0.5, '$-L/2$', 'Interpreter', 'latex')
    text((L / 2) - 0.2, -0.5, '$L/2$', 'Interpreter', 'latex')
    text(-0.1, -0.5, '$0$', 'Interpreter', 'latex')
    text(L/2 + 1, -0.5, 'Position, x', 'Interpreter', 'latex')
    
    % y
    
    text(-(L / 2) - 2.1, -0.45, '$-(2/L)^{1/2}$', 'Interpreter', 'latex')
    text(-(L / 2) - 0.4, 0, '$0$', 'Interpreter', 'latex')
    text(-(L / 2) - 1.8, 0.45, '$(2/L)^{1/2}$', 'Interpreter', 'latex')
else
    ylim([0; 10])
    xlim([-5, 10])
    ylabel('Energy, $E/E_{1}$', 'Interpreter', 'latex')
    yt = get(gca,'YTick');
    set(gca,'YTickLabel', sprintf(' ',yt))
    xt = get(gca,'XTick');
    set(gca,'XTickLabel', sprintf(' ',xt))
    plot([L/2 L/2], get(gca, 'Ylim'), 'k');
    
    text(5.3111, 9.2315, '$E_3$', 'Interpreter', 'latex')
    text(5.2650, 4.2510, '$E_2$', 'Interpreter', 'latex')
    text(5.2880, 1.2160, 9, '$E_1$', 'Interpreter', 'latex')
    
    % x
    
    text(-(L / 2) - 0.8, -0.5, '$-L/2$', 'Interpreter', 'latex')
    text((L / 2) - 0.2, -0.5, '$L/2$', 'Interpreter', 'latex')
    text(-0.1, -0.5, '$0$', 'Interpreter', 'latex')
    text(L/2 + 1, -0.5, 'Position, x', 'Interpreter', 'latex')
    
    % y
    
    text(-(L / 2) - 0.4, 1, '1', 'Interpreter', 'latex')
    text(-(L / 2) - 0.4, 4, '4', 'Interpreter', 'latex')
    text(-(L / 2) - 0.4, 9, '9', 'Interpreter', 'latex')

end
end