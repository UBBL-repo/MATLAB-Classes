% Debugger for Velmex positioning system

delete( instrfind );

clear;
clc;
addpath( '../hardware' );

% Set syringe properties
pos = velmex;

% Connect
[a, b] = pos.connectVelmex();


