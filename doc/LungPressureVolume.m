
% This is Project 7.3.1

% Constants
P_surface = 101325; % Atmospheric pressure at surface in Pascals
rho_seawater = 1025; % Density of seawater in kg/m^3
g = 9.81; % Gravitational acceleration in m/s^2
initial_volume = 6; % Initial volume of air in lungs in liters
descent_rate = 23; % Descent rate in meters per minute (maximum)
ascent_rate = 12; % Ascent rate in meters per minute (maximum)
max_depth = 50; % Maximum depth in meters

% The initial conditions
initial_depth = 0; % Starting depth (surface)
time_step = 0.05; % Time step in minutes

% Time arrays for descent and ascent
descent_time = 0:time_step:max_depth/descent_rate; % Time to descend to max depth
ascent_time = 0:time_step:max_depth/ascent_rate; % Time to ascend from max depth

% Force the final time point to be exactly the end of the dive
if descent_time(end) ~= max_depth/descent_rate
    descent_time = [descent_time, max_depth/descent_rate];
end

if ascent_time(end) ~= max_depth/ascent_rate
    ascent_time = [ascent_time, max_depth/ascent_rate];
end

% Pressure at each depth for descent and ascent
depths_descent = descent_rate * descent_time; % Depth during descent
depths_ascent = max_depth - ascent_rate * ascent_time; % Depth during ascent

% Pressure at each depth
pressures_descent = P_surface + rho_seawater * g * depths_descent; % Pressure in Pascals during descent
pressures_ascent = P_surface + rho_seawater * g * depths_ascent; % Pressure in Pascals during ascent

% Converting pressures from Pascals to atmospheres for convenience
pressures_atm_descent = pressures_descent / 101325;
pressures_atm_ascent = pressures_ascent / 101325;

% Volume at each depth using Boyle's Law
volumes_descent = initial_volume * P_surface ./ pressures_descent; % Volume during descent
volumes_ascent = initial_volume * P_surface ./ pressures_ascent; % Volume during ascent

% Plot for descent
figure;
[ax1, h1, h2] = plotyy(depths_descent, volumes_descent, depths_descent, pressures_atm_descent);
set(h1, 'LineWidth', 2, 'Marker', 'o', 'MarkerFaceColor', 'b', 'Color', 'b');
set(h2, 'LineWidth', 2, 'Marker', 'x', 'MarkerFaceColor', 'r', 'Color', 'r');
ylabel(ax1(1), 'Volume of Air in (L)', 'FontSize', 18);
ylabel(ax1(2), 'Pressure (atm)', 'FontSize', 18);
xlabel('Depth (m)', 'FontSize', 18);
title('Descent: Pressure and Volume of Air in the Lungs', 'FontSize', 18);
legend('Volume', 'Pressure', 'Location', 'Northeast', 'FontSize', 18);
grid on;

% Plot for ascent
figure;
[ax2, h3, h4] = plotyy(depths_ascent, volumes_ascent, depths_ascent, pressures_atm_ascent);
set(h3, 'LineWidth', 2, 'Marker', 'o', 'MarkerFaceColor', 'b', 'Color', 'b');
set(h4, 'LineWidth', 2, 'Marker', 'x', 'MarkerFaceColor', 'r', 'Color', 'r');
ylabel(ax2(1), 'Volume of Air in (L)', 'FontSize', 18);
ylabel(ax2(2), 'Pressure (atm)', 'FontSize', 18);
xlabel('Depth (m)', 'FontSize', 18);
title('Ascent: Pressure and Volume of Air in the Lungs', 'FontSize', 18);
legend('Volume', 'Pressure', 'Location', 'Northeast', 'FontSize', 18);
grid on;

