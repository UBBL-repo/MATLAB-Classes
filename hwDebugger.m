% Script to incorporate all hardware

% Delete all existing instrument objects
delete( instrfind );

clear all;
close all;
clc;

% Add necessary classes
addpath( 'C:\MATLAB\hardware' );

% Connect hardware
wavegen = keyAWG;
wavegen.connectWaveGen;

scope = tekDPO;
scope.connectScope;

slider = velmex;
slider.connectVelmex;

% Set slider paraemters
slider.setZeroPosition;
Nx = 2;
Ny = 2;
Nz = 2;
xVec = linspace( -5, 5, Nx );
yVec = linspace( -5, 5, Ny );
zVec = linspace( -5, 5, Nz );

% Initialze data storage struct
data( Nx, Ny, Nz ).timeSeries = [];

% Set wavegen parameters --------------------------------------------------
f0 = 50E3; % [Hz]
numCycles = 10;
repetitionPeriod = 1E-2; % [s]
voltage = 0.1; % [V]
offset = 0; % [V]
phase = 0; % [rad]

wavegen.setVoltage( voltage );
wavegen.setFrequency( f0 );
wavegen.setBurstParameters( numCycles, repetitionPeriod, phase, 'trigger');
wavegen.setTriggerMode( 'immediate' ); % Only output signal on trigger in

wavegen.outputOn;
% -------------------------------------------------------------------------

% Move to each position and collect data
for xCount = 1:length(xVec)
    % Get current values
    x = xVec( xCount );
    
    for yCount = 1:length(yVec)
        y = yVec( yCount );
        
        for zCount = 1:length(zVec)
            z = zVec(zCount);
            
            % Move to position
            slider.goToPosition(x, y, z);
            
            % Get data
            [t, s, result] = scope.getScreenData;
            
            % Get sampling frequency
            Fs = scope.getSamplingFrequency;
            
            % Plot most recent data
            figureExists = ~isempty( findobj( 'Tag', 'AcquisitionPlot' ) );
            if figureExists
                plot( t, s, 'k', 'LineWidth', 2.2 );
            else
                figure();
                set( gcf, 'Tag', 'AcquisitionPlot' );
                set(gcf, 'Color', 'w' );
                plot( t, s, 'k', 'LineWidth', 2.2 );
                xlabel( 'Time [s]' );
                ylabel( 'Signal [V]' );
                title( 'Last Aquisition' );
            end
            
            % Store results for this step
            data( xCount, yCount, zCount ).timeSeries = s;
            data( xCount, yCount, zCount ).samplingFrequency = Fs;
            data( xCount, yCount, zCount ).position = [x, y, z];
            
        end
    end
end

