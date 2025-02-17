delete(instrfind);
clear all
close all
clc

addpath( genpath( 'C:\MATLAB\hardware' ) );

wavegen = keyAWG;
[~, rslt] = wavegen.connectWaveGen();

% Set wavegen parameters --------------------------------------------------
f0 = 520E3; % [Hz]
numCycles = 10;
repetitionPeriod = 1E-2; % [s]
voltage = 0.1; % [V]
offset = 0; % [V]
phase = 0; % [rad]

wavegen.setVoltage( voltage, 'Vpp' );
wavegen.setFrequency( f0 );
wavegen.setBurstParameters( numCycles, repetitionPeriod, phase, 'trigger');
% wavegen.setTriggerMode( 'external' ); % Only output signal on trigger in
% 
% wavegen.outputOn;
% -------------------------------------------------------------------------

