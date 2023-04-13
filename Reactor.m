% Plug flow reactor with second-order reaction
% Parameters
V = 10; % Volume of reactor (L)
k = 0.5; % Reaction rate constant (L/mol/min)
C0 = 1; % Initial concentration of reactant (mol/L)
tspan = [0 10]; % Time span for simulation (min)

% Differential equations
ode = @(t,C) -k*C.^2;

% Solve the differential equation
[t,C] = ode45(ode, tspan, C0);

% Plot the results
plot(t, C);
xlabel('Time (min)');
ylabel('Concentration (mol/L)');
title('Concentration vs. Time in a Plug Flow Reactor with Second-Order Reaction');
