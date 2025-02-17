clear all
close all
clc

Fs = 1E6; % [Hz]
dt = 1./Fs; % [s]

tMax = 0.1; % [s]

f0 = 1E5;
BW = 0.8;

reflection = 0.5;
noise = 0.25;
delay = 0.05;


t = dt:dt:tMax;

% Trasmitted signal
s0 = gauspuls( t - 0.01, f0, BW );

% Received signal
s1 = reflection.*s0 + noise.*rand(1, length(s0));

% Plot
hold on;
plot( t.*1E3, s0, 'k' );
plot( (t + delay).*1E3, s1 );
xlabel( 'Time [ms]' );
ylabel( 'Signal [AU]' );
zoom xon;

% Compute cross correlation
[r, lags] = xcorr( s0, s1 );
figure()
plot( lags.*dt, r );
