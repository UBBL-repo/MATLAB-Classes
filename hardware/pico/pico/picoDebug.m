clear all
close all
clc

delete( instrfind );

scope = pico;

[~, result] = scope.connectPico;

% [~, result] = scope.setTrigger( 1, 20E-3 );
[~, result] = scope.setSampleRate( 15E6 );
[~, result] = scope.setWindow( 5E-6, 50E-6 );
[~, result] = scope.setTrigger( 2, 2 );

scope.PlotOptions.ylim = [-0.1, 0.1]; % [V]

while 1
    scope.displayData( [1, 2], 1 );
    pause(0.1);
end

