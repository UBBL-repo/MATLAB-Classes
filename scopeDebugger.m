% Debugger for tekDPO scope class

clear;
delete( instrfind );
clc;
addpath( './hardware' );

% NOTES:
% HORIZONTAL:
%   RECORDLENGTH - Number of points per window
%   RESOLUTION - 

% Create device object
scope = tekDPO;

% Turn on verbose mode (for debugging)
scope.Verbose = 1;

% Connect device to MATLAB
[~, rslt] = scope.connectScope();

% Set to average mode
scope.setAcquisitionMode( 'av', 128 );

pause(10);

% Set to average mode
% scope.sendCommand( 'ACQuire:MODe AVErage', 0, 0 ); 
% scope.sendCommand( 'ACQuire:NUMAVg 64', 0, 0 );
% % scope.sendCommand( 'ACQuire:STATE ON', 0, 0 );
% % scope.sendCommand( 'ACQuire:STOPAfter SEQUENCE', 0, 0 );
% 
% scope.sendCommand( 'DATA:COMPOSITION SINGULAR_YT', 0, 0 );

[a,b,~] = scope.saveData;
plot(a,b)