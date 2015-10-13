%%
% Prosjekt01_IntegrateFilterDerivate
%
% Program for kjøring av motor A via joystick.  
% Måling av lyssignal og plotting av data som funksjon av tid
% Programmet skal brukes til etablering av funksjonene for 
% integrasjon, filtrering og derivasjon.

clear,clc, close all                %Cleans workspace, figures and cmdw
online=0;                           %1 if NXT is connected to computer, set manually.
filename = 'P03_Lys.mat';           %If online = 0, this data file is used
scrsz = get(groot,'ScreenSize');    %Get screensize
Samples = 10;                       %Number of samples used in FIR filter
P = 2;
I = 0;
D = 0;
fart = 15;
                          


P03_InitializeNXT 
P03_GetFirstMeasurement
while JoyMainSwitch == 0 && Lys(k) < 610
    P03_GetNewMeasurement          
    P03_MathCalculations    
    P03_CalculateAndSetMotorPower 
    P03_PlottData 

    
    
end
verdi = Tid(k)*100 + LysIntegrert(k)
P03_CloseMotorsAndSensors





