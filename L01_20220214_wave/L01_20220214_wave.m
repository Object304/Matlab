clc, clear, close all
x = 0:0.01:2;
x_dot = 0:0.2:2;
drawArrow = @(x,y,varargin) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0, varargin{:} ) 
while 1
    for i = 0:0.05:2
        plot(x, sin(2*pi*x - pi*i), x_dot, sin(2*pi*x_dot - pi*i), '*r')
        hold on
        for ar = 1:11
            x1 = [x_dot(ar) x_dot(ar)];
            A = 1 - abs(sin(2*pi*x_dot(ar) - pi*i));
            y = sin(2*pi*x_dot(ar) - pi*i);
            y1 = [y, y - A * cos(2*pi*x_dot(ar) - pi*i)];
            drawArrow(x1, y1, 'linewidth', 1, 'color', 'k')
        end
        hold off
        xlim([0 2])
        ylim([-2 2])
        frame = getframe;
        image = frame2im(frame);
        [X, cmap] = rgb2ind(image, 256);
        if i == 0
            imwrite(X, cmap, 'myanim.gif', 'gif', 'LoopCount', Inf, ...
                'DelayTime', 1/24);
        else
            imwrite(X, cmap, 'myanim.gif', 'gif', 'WriteMode', 'append', ...
                'DelayTime', 1/24);
        end
    end
end