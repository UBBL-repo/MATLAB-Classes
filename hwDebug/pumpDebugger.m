% Debugger for kdsPump class

delete( instrfind );

clear;
clc;
addpath( '../hardware' );

% Set syringe properties
syr.Volume_ml = 30; % [ml]
syr.InnerDiameter_mm = 22.9; % [mm]
syr.Name = '30 mL syringe'; % Optional

% Create device object
x = kdsPump;

% Connect device to MATLAB
x.connectPump;

% Specify syringe parameters
x.Syringe = syr;

% Set object wait time (i.e., how long it takes the pump to process each
% command). It's less if you prepend "@" to the commands (which suppresses
% the GUI updates), but if you want to show all the updates, set this to 
x.WaitTime = 0.2; % [s]


% %% Testing commands
% [result, response] = x.sendKdsCommand( 'dim 20', 0, 0 );
% 
% 
% % [a, b] = x.setSyringeDiameter( 025.00 );
% % [a, b] = x.sendKdsCommand( '@svolume 50 ml', 0, 0 );
% % [a, b] = x.sendKdsCommand( '@irate 18 ml/min', 0, 0 );
% % [a, b] = x.sendKdsCommand( '@wrate 18 ml/min', 0, 0 );
% % [a, b] = x.sendKdsCommand( '@tvolume 5 ml', 0, 0 );
% % [a, b] = x.sendKdsCommand( '@load qs wi', 0, 0 );
% % [a, b] = x.sendKdsCommand( '@run', 0, 0 );
% 
% [result, response] = x.setSyringeParameters( 025.00, 060.00 );
% [result, response] = x.runContinuous( 2.5, 020.00, 1 );
% 
% % while 1
% %     [a, b] = x.sendKdsCommand( 'irun', 1, 0 );
% %     [a, b] = x.sendKdsCommand( 'wrun', 1, 0 );
% % end