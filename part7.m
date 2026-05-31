% DE Family: x' = kx(1-x)

k = 2;                          % growth rate
h_vals = [1, 0.5, 0.1, 0.01];   % step sizes to test (updated to include h = 1)

lw = 1.5;                       % desired line width
fs = 14;                        % larger font size for axes and titles

figure;
for p = 1:numel(h_vals)
    h = h_vals(p);
    t = 0:h:10;                 % time vector
    % First initial condition
    x1 = zeros(1, numel(t));    
    x1(1) = 0.5;
    for i = 1:(numel(t)-1)
       dx = k * x1(i) * (1 - x1(i));
       x1(i+1) = x1(i) + dx * h;
    end

    % Second initial condition
    x2 = zeros(1, numel(t));
    x2(1) = 2;
    for i = 1:(numel(t)-1)
       dx = k * x2(i) * (1 - x2(i));
       x2(i+1) = x2(i) + dx * h;
    end

    % Plot both solutions on the same subplot for this h
    subplot(numel(h_vals),1,p)
    p1 = plot(t, x1, '-o', 'MarkerSize', 3, 'LineWidth', lw, 'DisplayName', 'x(1)=0.5'); hold on
    p2 = plot(t, x2, '-s', 'MarkerSize', 3, 'LineWidth', lw, 'DisplayName', 'x(1)=2');
    hold off
    xlabel('t', 'FontSize', fs)
    ylabel('x(t)', 'FontSize', fs)
    title(sprintf('Forward Euler, k = %d, h = %.3f', k, h), 'FontSize', fs)
    legend('Location','best', 'FontSize', fs-2)
    grid on
    set(gca, 'FontSize', fs)
end

% repeat for k = -2 to observe behavior with negative growth rate
k = -2;
figure;
for p = 1:numel(h_vals)
    h = h_vals(p);
    t = 0:h:10;
    x = zeros(1, numel(t));
    x(1) = 0.5;                 % initial condition

    % Euler integration loop
    for i = 1:(numel(t)-1)
       dx = k * x(i) * (1 - x(i));
       x(i+1) = x(i) + dx * h;
    end

    % Plot results for this h
    subplot(numel(h_vals),1,p)
    plot(t, x, '-o', 'MarkerSize', 3, 'LineWidth', lw)
    xlabel('t', 'FontSize', fs)
    ylabel('x(t)', 'FontSize', fs)
    title(sprintf('Solution of dx/dt = kx(1-x) (forward Euler), k = %d, h = %.3f', k, h), 'FontSize', fs)
    grid on
    set(gca, 'FontSize', fs)
end

% same negative k with different initial condition
k = -2;
figure;
for p = 1:numel(h_vals)
    h = h_vals(p);

    Tfinal = h * 37;
    t = 0:h:Tfinal;
    x = zeros(1, numel(t));
    x(1) = 2;                   % initial condition > 1

    % Forward Euler updates
    for i = 1:(numel(t)-1)
       dx = k * x(i) * (1 - x(i));
       x(i+1) = x(i) + dx * h;
    end

    % Plot each case (log scale for y-axis)
    subplot(numel(h_vals),1,p)
    semilogy(t, max(x, eps), '-o', 'MarkerSize', 3, 'LineWidth', lw) % avoid log(0) by clamping to eps
    xlabel('t', 'FontSize', fs)
    ylabel('x(t) (log scale)', 'FontSize', fs)
    title(sprintf('Solution of dx/dt = k*x*(1-x) (forward Euler), k = %d, h = %.3f', k, h), 'FontSize', fs)
    grid on
    set(gca, 'FontSize', fs)
end
