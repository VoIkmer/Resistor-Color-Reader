% Resistor Color Reader Script
clear;
close all;
clc;

% Color dictionary for values and multipliers
colors = struct('black', 0, 'brown', 1, 'red', 2, 'orange', 3, ...
                'yellow', 4, 'green', 5, 'blue', 6, 'violet', 7, ...
                'gray', 8, 'white', 9, 'gold', -1, 'silver', -2);

% Color mapping for RGB visualization
colors_rgb = struct('black', [0, 0, 0], 'brown', [0.6, 0.3, 0], 'red', [1, 0, 0], ...
                    'orange', [1, 0.5, 0], 'yellow', [1, 1, 0], 'green', [0, 0.5, 0], ...
                    'blue', [0, 0, 1], 'violet', [0.5, 0, 0.5], 'gray', [0.5, 0.5, 0.5], ...
                    'white', [1, 1, 1], 'gold', [0.83, 0.68, 0.21], 'silver', [0.75, 0.75, 0.75]);

% Multipliers for each color
multiplier = [1, 10, 100, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8, 1e9, 0.1, 0.01];

% Tolerance color options and values (4-band resistors)
tolerance_4band = {'brown', 'red', 'gold', 'silver'};
tolerance_values_4band = {'±1%', '±2%', '±5%', '±10%'};

% Tolerance color options and values (5-band resistors)
tolerance_5band = {'brown', 'red', 'green', 'blue', 'violet'};
tolerance_values_5band = {'±1%', '±2%', '±0.5%', '±0.25%', '±0.1%'};

% Choose resistor type
num_bands = input('How many bands does the resistor have (4 or 5)? ');

% Get color inputs based on the number of bands
switch num_bands
    case 4
        band1 = lower(input('Enter the color of the first band: ', 's'));
        band2 = lower(input('Enter the color of the second band: ', 's'));
        band3 = lower(input('Enter the color of the third band (multiplier): ', 's'));
        band4 = lower(input('Enter the color of the fourth band (tolerance): ', 's'));
        
        % Validate color names
        if ~isfield(colors, band1) || ~isfield(colors, band2) || ...
           ~isfield(colors, band3) || ~isfield(colors, band4)
            error('One or more entered colors are invalid. Please check available colors.');
        end
        
        % Calculate resistor value
        base_value = colors.(band1) * 10 + colors.(band2);
        resistor_value = base_value * multiplier(colors.(band3) + 1);
        tolerance = tolerance_values_4band{strcmp(tolerance_4band, band4)};
        
        % Output
        band_colors = {band1, band2, band3, band4};
        band_values = {num2str(colors.(band1)), num2str(colors.(band2)), ...
                       ['10^', num2str(colors.(band3))], tolerance};
        
    case 5
        band1 = lower(input('Enter the color of the first band: ', 's'));
        band2 = lower(input('Enter the color of the second band: ', 's'));
        band3 = lower(input('Enter the color of the third band: ', 's'));
        band4 = lower(input('Enter the color of the fourth band (multiplier): ', 's'));
        band5 = lower(input('Enter the color of the fifth band (tolerance): ', 's'));
        
        % Validate color names
        if ~isfield(colors, band1) || ~isfield(colors, band2) || ...
           ~isfield(colors, band3) || ~isfield(colors, band4) || ...
           ~isfield(colors, band5)
            error('One or more entered colors are invalid. Please check available colors.');
        end
        
        % Calculate resistor value
        base_value = colors.(band1) * 100 + colors.(band2) * 10 + colors.(band3);
        resistor_value = base_value * multiplier(colors.(band4) + 1);
        tolerance = tolerance_values_5band{strcmp(tolerance_5band, band5)};
        
        % Output
        band_colors = {band1, band2, band3, band4, band5};
        band_values = {num2str(colors.(band1)), num2str(colors.(band2)), ...
                       num2str(colors.(band3)), ['10^', num2str(colors.(band4))], tolerance};
        
    otherwise
        disp('Invalid number of bands. Please enter 4 or 5.');
        return;
end

clc;

% Display result
fprintf('\nResistor value: %.2f Ω %s\n', resistor_value, tolerance);

% Plot color bands and display resistor value
figure;
for i = 1:num_bands
    subplot(2, num_bands, i);
    rectangle('Position', [0, 0, 1, 1], 'FaceColor', colors_rgb.(band_colors{i}), 'EdgeColor', 'k');
    axis off;
    title(band_colors{i}, 'Interpreter', 'none'); % Color name
end

% Display band values below the color squares
for i = 1:num_bands
    subplot(2, num_bands, num_bands + i);
    text(0.5, 0.5, band_values{i}, 'HorizontalAlignment', 'center', 'Interpreter', 'none');
    axis off;
end

% Add resistor value above the bands
annotation('textbox', [0.2, 0.30, 0.6, 0.1], 'String', ...
           sprintf('Resistor of %.2f Ω %s', resistor_value, tolerance), ...
           'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold', ...
           'EdgeColor', 'none');
