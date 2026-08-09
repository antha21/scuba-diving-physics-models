% This is Project 7.3.3

% Given Data
V1 = 0.008; % Initial volume in m^3 (8 L)
P1 = 1.0;   % Atmospheric pressure at surface (atm)
depths = 0:5:50; % Depths in meters
P_water = 0.1; % Increase in pressure per meter depth (1 atm per 10m)

% Compute pressure and volume at each depth
P2 = P1 + depths * P_water; % Absolute pressure at depth
V2 = V1 .* (P1 ./ P2); % Boyle's Law: P1*V1 = P2*V2

% Plot results
figure;
[ax, h1, h2] = plotyy(depths, V2, depths, P2, 'plot');
set(h1, 'LineWidth', 2, 'Marker', 'o', 'MarkerFaceColor', 'b', 'Color', 'b');
set(h2, 'LineWidth', 2, 'Marker', 's', 'MarkerFaceColor', 'r', 'Color', 'r');
ylabel(ax(1), 'Volume (m^3)', 'Fontsize', 18);
ylabel(ax(2), 'Pressure (atm)', 'Fontsize', 18);
xlabel('Depth (m)', 'Fontsize', 18);
title('Pressure and Volume Relationship in a Diver''s Suit', 'Fontsize', 18);
legend('Volume', 'Pressure', 'Location', 'Northeast', 'Fontsize', 18);
grid on;


