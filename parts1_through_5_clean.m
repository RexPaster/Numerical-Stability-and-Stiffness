%% Part 1
% Euler's Method
figure();

% Settings
x_prime = @(t, x, k) k.*x; %1st Order Expression to solve
x_0 = 1;  % initial x
k_list = [-2.5, -2, -1, 0, 1]; %values for k
h_list = [2, 1, 0.5, 0.1];  % step sizes
t_final = 6; %Upper Bound of Evaluation

legend_list = strings(1, numel(k_list)*numel(h_list)); %Initialize the Legend Naming System
legend_index = 1;

%Visual Settings
colors = lines(length(k_list)); %Color for each k value
line_styles = ["-","--",":","-"]; %Line style for each h value

hold on; %Plot All on Same Graph

for k_index = 1:length(k_list) %Iterate though each k value

    k = k_list(k_index);
    color = colors(k_index,:); %Assign color based on k

    for h_index = 1:length(h_list) %Iterate though each h value

        h = h_list(h_index);
        style = line_styles(h_index); %Assign line style based on h

        %Create time range
        t = 0:h:t_final;

        %Prepare Internal Vars
        x = zeros(size(t));
        n = numel(t);

        x(1) = x_0;  % set x(1) to initial x

        %Run Euler Iteration
        for i=1:n-1
            x(i+1) = x(i) + h * x_prime(t(i), x(i), k); %Evaluate the DE using Euler's Method
        end

        %Apply symmetric log transform for +/- values
        x_plot = sign(x) .* log10(1 + abs(x)); % symlog style

        %Plot Approximations
        plot(t, x_plot,'Color',color,'LineStyle',style,'LineWidth',1.5)

        %Append Legend Name
        legend_list(legend_index) = ("k = " + k + " | h = " + h);
        legend_index = legend_index + 1;

    end
end

hold off;

%Graph Settings
ylabel('$x \rightarrow \mathrm{sign}(x) \cdot \log_{10}(1 + |x|)$','Interpreter','latex'); %LaTeX y-axis
xlabel('t'); %x-axis label
title('Euler Approximation (Color = k | Line Style = h)') %Plot title
legend(legend_list,'Location','eastoutside') %Add legend
grid on %Turn on grid


%% CHATGPT UTILIZATION
% "can i make this axis exponential"
% "how can i make this exponential in both positive and negative axis"
% "help make this graph more digestable"

%% Part 2
% Q: When k = -2 what do you expect to happen to a solution x(t) as t
%    appoaches infinity? Describe some real-world situations where you
%    expect to see this type of behaviour.

% R: When k = -2, the DE will have a stable equilibrium for all values
%    on the line x = 0. Any initial value x != 0 will have an asymtotic 
%    behavior approaching x = 0 as t --> infinity. If the initial value is
%    equal to 0, for all t x will remain equal to zero as t --> infinity.



%% Part 3
% Euler's Method
figure();

% Settings
x_prime = @(t, x, k) k.*x; %1st Order Expression to solve
x_0 = 100;  % initial x
k = -2; %value for k
h_list = [2.5, 1, 0.75, 0.5, 0.3, 0.25];  % step sizes
t_final = 15; %Upper Bound of Evaluation

legend_list = strings(1, numel(h_list)); %Initialize the Legend Naming System
legend_index = 1;

%Visual Settings
colors = lines(length(h_list)); %Color for each k value

hold on; %Plot All on Same Graph

for h_index = 1:length(h_list) %Iterate though each h value

    h = h_list(h_index);
    color = colors(h_index,:); %Assign line style based on h

    %Create time range
    t = 5:h:t_final;  % start at 5 instead of 0 to make xaxis log scale work

    %Prepare Internal Vars
    x = zeros(size(t));
    n = numel(t);

    x(1) = x_0;  % set x(1) to initial x

    %Run Euler Iteration
    for i=1:n-1
        x(i+1) = x(i) + h * x_prime(t(i), x(i), k); %Evaluate the DE using Euler's Method
    end

    %Apply symmetric log transform for +/- values
    x_plot = sign(x) .* log10(1 + abs(x)); % symlog style

    %Plot Approximations
    plot(t, x_plot,'Color',color,'LineWidth',1.5)

    %Append Legend Name
    legend_list(legend_index) = (" h = " + h);
    legend_index = legend_index + 1;

end
hold off;

%Graph Settings
ylabel('$x \rightarrow \mathrm{sign}(x) \cdot \log_{10}(1 + |x|)$','Interpreter','latex'); %LaTeX y-axis
xlabel('t'); %x-axis label
title('Euler Approximation (k = -2)') %Plot title
legend(legend_list,'Location','eastoutside') %Add legend
grid on %Turn on grid
xscale log;

hold off;

% Response
% Q: Find the range of values for h such that the approximation from Euler's
%    method also captures this behaviour. What happens when h is outside of
%    this range?


% R: The value of h where this behavior is correctly represented is
%    h = (0, -1/(k)] = (0, 0.5]. There are different behaviors for
%    different values of h > -1/k. These Behaviours are as follows:
%    if h = (-1/k, (-2)/k)) then the solver will ocillate with a
%    dampening effect. if h = (-2)/k, the solver will infinitly ocilate
%    between + and -. and if h > (-2)/k, the solver will oscilate with
%    blowout.

%% Part 4
% Response
% Q: Why might this cause problems when modelling a real-world situation?
%    You might want to also briefly discuss the case where k is large and
%    negative.

% R: When modeling real world situations, we do not have controll over
%    the value of k. Because of this range of correct Euler behavior we
%    found above, we can see how this would cause issues. If k is very
%    large and negative, than the range where a solver wont ocillate is
%    h =(0, -1/(k)). With a very large k, this means h must be very small
%    leading to more computational intensity and more rounding error
%    possibilities. Even if we only want the de to eventually reach 0, and
%    dont care about ocilation, with a very large k, the range of
%    acceptable values would be h = (0, (-2)/k) which is still very small
%    given a large k value, meaning there is still significant
%    computational intensity.

%% Part 5:
% R:   Yes, this family does have a unique solution given a initial value.
%      The work is on Rex's Remarkable. The fact that his equation has a
%      clean unique solution [x(t) = x_0*e^(kt)] tells us that the errors
%      in the Euler modeling in this equation stem from the method of
%      modeling(euler) rather than a behavior of the equation itself.