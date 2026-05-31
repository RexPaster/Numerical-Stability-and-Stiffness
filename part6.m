% iii) Use several values of h on the same plot
hs = linspace(0.01, 1, 10);   % 10 different time steps between 0.01 and 1
k = 2;
x0 = 1000; % arbitrary positive x value
colors = lines(numel(hs));
ymax = 1e9; % Cap y to make all the lines visible

figure; hold on;
Tfinal = (numel(x)-1)*h; %Tfinal dependent on h
for j = 1:numel(hs)
    h_j = hs(j);
    t_j = 0:h_j:Tfinal;
    x_j = zeros(1, numel(t_j));
    x_j(1) = x0;
    for i = 1:(numel(t_j)-1)
        x_j(i+1) = x_j(i) + k * x_j(i) * h_j; %Euler step calculation
        if x_j(i+1) > ymax
            x_j(i+1) = ymax;
            % If capped, keep remaining values at cap and break integration
            if i+1 < numel(t_j)
                x_j(i+2:end) = ymax;
            end
            break;
        end
    end
    %Plotting
    plot(t_j, x_j, '-', 'Color', colors(j,:), 'DisplayName', sprintf('h=%.3g', h_j), 'LineWidth', 1.5);
end

%Plot formatting
xlabel('t','FontSize',14)
ylabel('x(t)','FontSize',14)
title('Forward Euler for several h values','FontSize',16)
legend('Location','northwest','FontSize',12)
set(gca,'FontSize',12)
grid on
hold off