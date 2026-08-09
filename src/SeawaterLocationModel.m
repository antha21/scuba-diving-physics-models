
% This is Project 7.3.2

% Constants
P_surface = 101325; % Atmospheric pressure at surface in Pascals
g = 9.81; % Gravitational acceleration in m/s^2
initial_volume = 6; % Initial volume of air in lungs in liters
descent_rate = 23; % Descent rate in meters per minute (maximum)
ascent_rate = 12; % Ascent rate in meters per minute (maximum)
max_depth = 50; % Maximum depth in meters

% Temperature and corresponding seawater densities (kg/m^3)
% Juneau, Alaska at 10 C: 1027 kg/m^3
% Paita, Peru at 20 C: 1025 kg/m^3
% Savannah Beach, GA at 30 C: 1022 kg/m^3

% Reference: Paita, Peru (20 C)
rho_ref = 1025;         % Reference density kg/m^3
T_ref = 20;             % Reference Temp C

% Coefficient of temperature dependence for seawater density (1/C)
beta = 0.0002;

% Initial temperatures for each location (C)
T_juneau = 10; % Juneau's temperature in C
T_paita = 20; % Paita's temperature in C
T_savannah = 30; % Savannah's temperature in C

% Seawater densities as a function of temperature for each location
density_juneau = rho_ref * (1 - beta * (T_juneau - T_ref));
density_paita = rho_ref * (1 - beta * (T_paita - T_ref));
density_savannah = rho_ref * (1 - beta * (T_savannah - T_ref));

% Depth array for descent and ascent
descent_time = 0:0.05:max_depth/descent_rate; % Time to descend to max depth
ascent_time = 0:0.05:max_depth/ascent_rate; % Time to ascend from max depth

% Depth during descent and ascent
depths_descent = descent_rate * descent_time; % Depth during descent
depths_ascent = max_depth - ascent_rate * ascent_time; % Depth during ascent

% Pressure at each depth for each location
pressures_descent_juneau = P_surface + density_juneau * g * depths_descent;
pressures_descent_paita = P_surface + density_paita * g * depths_descent;
pressures_descent_savannah = P_surface + density_savannah * g * depths_descent;

pressures_ascent_juneau = P_surface + density_juneau * g * depths_ascent;
pressures_ascent_paita = P_surface + density_paita * g * depths_ascent;
pressures_ascent_savannah = P_surface + density_savannah * g * depths_ascent;

% Converting pressures from Pascals to atmospheres for convenience
pressures_atm_descent_juneau = pressures_descent_juneau / 101325;
pressures_atm_descent_paita = pressures_descent_paita / 101325;
pressures_atm_descent_savannah = pressures_descent_savannah / 101325;

pressures_atm_ascent_juneau = pressures_ascent_juneau / 101325;
pressures_atm_ascent_paita = pressures_ascent_paita / 101325;
pressures_atm_ascent_savannah = pressures_ascent_savannah / 101325;

% Volume at each depth using Boyle's Law for each location
volumes_descent_juneau = initial_volume * P_surface ./ pressures_descent_juneau;
volumes_descent_paita = initial_volume * P_surface ./ pressures_descent_paita;
volumes_descent_savannah = initial_volume * P_surface ./ pressures_descent_savannah;

volumes_ascent_juneau = initial_volume * P_surface ./ pressures_ascent_juneau;
volumes_ascent_paita = initial_volume * P_surface ./ pressures_ascent_paita;
volumes_ascent_savannah = initial_volume * P_surface ./ pressures_ascent_savannah;

% Small offset values (Better Clarity)
offset_volume_juneau = 0.1; % Offset for volume of Juneau
offset_volume_paita = 0.2; % Offset for volume of Paita
offset_volume_savannah = 0.3; % Offset for volume of Savannah

offset_pressure_juneau = 0.3; % Offset for pressure of Juneau
offset_pressure_paita = 0.2; % Offset for pressure of Paita
offset_pressure_savannah = 0.1; % Offset for pressure of Savannah

% The offsets to the volume and pressure for each location
volumes_descent_juneau = volumes_descent_juneau + offset_volume_juneau;
volumes_descent_paita = volumes_descent_paita + offset_volume_paita;
volumes_descent_savannah = volumes_descent_savannah + offset_volume_savannah;

volumes_ascent_juneau = volumes_ascent_juneau + offset_volume_juneau;
volumes_ascent_paita = volumes_ascent_paita + offset_volume_paita;
volumes_ascent_savannah = volumes_ascent_savannah + offset_volume_savannah;

pressures_atm_descent_juneau = pressures_atm_descent_juneau + offset_pressure_juneau;
pressures_atm_descent_paita = pressures_atm_descent_paita + offset_pressure_paita;
pressures_atm_descent_savannah = pressures_atm_descent_savannah + offset_pressure_savannah;

pressures_atm_ascent_juneau = pressures_atm_ascent_juneau + offset_pressure_juneau;
pressures_atm_ascent_paita = pressures_atm_ascent_paita + offset_pressure_paita;
pressures_atm_ascent_savannah = pressures_atm_ascent_savannah + offset_pressure_savannah;

% Descent Plot (Volume and Pressure)
figure;

% Volume Plot
subplot(2, 1, 1);
plot(depths_descent, volumes_descent_juneau, 'ro-', 'LineWidth', 2); % Juneau Volume (Red)
hold on;
plot(depths_descent, volumes_descent_paita, 'bs-', 'LineWidth', 2); % Paita Volume (Blue)
plot(depths_descent, volumes_descent_savannah, 'g^-', 'LineWidth', 2); % Savannah Volume (Green)
ylabel('Volume of Air (L)', 'FontSize', 18);
grid on;
legend('Juneau Volume (10 C)', 'Paita Volume (20 C)', 'Savannah Volume (30 C)', 'Location', 'northeast');
title('Descent: Volume of Air in the Lungs', 'FontSize', 18);

% Pressure Plot
subplot(2, 1, 2);
plot(depths_descent, pressures_atm_descent_juneau, 'rx-', 'LineWidth', 2); % Juneau Pressure (Red)
hold on;
plot(depths_descent, pressures_atm_descent_paita, 'bx--', 'LineWidth', 2); % Paita Pressure (Blue)
plot(depths_descent, pressures_atm_descent_savannah, 'gx--', 'LineWidth', 2); % Savannah Pressure (Green)
ylabel('Pressure (atm)', 'FontSize', 18);
xlabel('Depth (m)', 'FontSize', 18);
grid on;
legend('Juneau Pressure (10 C)', 'Paita Pressure (20 C)', 'Savannah Pressure (30 C)', 'Location', 'northeast');
title('Descent: Pressure in the Lungs', 'FontSize', 18);

% Ascent Plot (Volume and Pressure) – Separate Subplots
figure;

% Volume Plot
subplot(2, 1, 1);
plot(depths_ascent, volumes_ascent_juneau, 'ro-', 'LineWidth', 2); % Juneau Volume (Red)
hold on;
plot(depths_ascent, volumes_ascent_paita, 'bs-', 'LineWidth', 2); % Paita Volume (Blue)
plot(depths_ascent, volumes_ascent_savannah, 'g^-', 'LineWidth', 2); % Savannah Volume (Green)
ylabel('Volume of Air (L)', 'FontSize', 18);
grid on;
legend('Juneau Volume (10 C)', 'Paita Volume (20 C)', 'Savannah Volume (30 C)', 'Location', 'northeast');
title('Ascent: Volume of Air in the Lungs', 'FontSize', 18);

% Pressure Plot
subplot(2, 1, 2);
plot(depths_ascent, pressures_atm_ascent_juneau, 'rx-', 'LineWidth', 2); % Juneau Pressure (Red)
hold on;
plot(depths_ascent, pressures_atm_ascent_paita, 'bx--', 'LineWidth', 2); % Paita Pressure (Blue)
plot(depths_ascent, pressures_atm_ascent_savannah, 'gx--', 'LineWidth', 2); % Savannah Pressure (Green)
ylabel('Pressure (atm)', 'FontSize', 18);
xlabel('Depth (m)', 'FontSize', 18);
grid on;
legend('Juneau Pressure (10 C)', 'Paita Pressure (20 C)', 'Savannah Pressure (30 C)', 'Location', 'northeast');
title('Ascent: Pressure in the Lungs', 'FontSize', 18);

