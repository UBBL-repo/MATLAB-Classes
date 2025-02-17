

delete( instrfind );
addpath( 'C:\MATLAB\hardware' ); % For hardware classes

clear all;
close all;
clc;

scope = tekDPO();
[a, b] = scope.connectScope();

tic;
[t, s] = scope.saveData(1, 30E3, 40E3);
toc
plot( t.*1E6, s );