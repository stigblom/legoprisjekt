%%
% Prosjekt01_IntegrateFilterDerivate
%
% Program for kjøring av motor A via joystick.  
% Måling av lyssignal og plotting av data som funksjon av tid
% Programmet skal brukes til etablering av funksjonene for 
% integrasjon, filtrering og derivasjon.

clear; close all       % Alltid lurt å rydde opp først
online=1;              % Er du koplet til NXT eller ikke?
filename = 'P02_Lys.mat'; % Angi navnet på datafilen dersom online=0. 
                          % Brukes ikke dersom online=1 

P02_InitializeNXT 
P02_GetFirstMeasurement
while ~JoyMainSwitch
    P02_GetNewMeasurement
    P02_MathCalculations    
    P02_CalculateAndSetMotorPower
    P02_PlottData
end
P02_CloseMotorsAndSensors


