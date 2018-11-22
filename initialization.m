%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialization for boost converter simulator with delays
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc

%%
delay = 0.625e-3;

E = 5;      % source voltage

% physical variables
L = 0.2;    % Conductance
C = 0.1;    % Capacitance
R = 3;      % Resistance

% initial conditions  
vC0 = 0;            % capacitor voltage
iL0 = 5;            % inductor current
q0 = 1;             % switch
x0 = [vC0; iL0; q0; 0; -1];

if x0(end)>delay
    error('Initial condition of the timer cannot be more than the specified delay')
elseif x0(end)<0
    if x0(end) == -1
        if x0(4) ~= 0
            error('Initial condition of the memory state should be 0 when the timer is -1')
        end
    else
        error('Initial condition of the timer cannot take negative values other than -1')
    end
end

Vdes = 7;            % Desired capacitor voltage
Ides = Vdes^2/(E*R); % corresponding inductor current

% uncomment to check steady-state performance
% x0 = [Vdes; Ides; 1; 0; -1];

K0 = 0.05;  % in (0,E/Vdes)
K1 = 0.12;  % in (0,1-E/Vdes)

% tolerance parameter for spatial regulatization/hysteresis
% increasing eps moves switching surfaces away
eps = 0e-3;

% simulation horizon                                                  
T = 15;                                                                 
J = 1e8;                                                                 
                                                                        
% rule for jumps                                                        
rule = 1; % do not change this
% rule = 1 -> priority for jumps                                        
% rule = 2 -> priority for flows                                        
% rule = 3 -> no priority, random selection when simultaneous conditions
                                                                                                                                    
%solver tolerances
RelTol = 1e-5;
MaxStep = .0005;
