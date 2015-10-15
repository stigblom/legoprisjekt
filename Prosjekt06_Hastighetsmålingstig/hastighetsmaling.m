%% Hastighetsmåling ved hjelp av lyssensor
% Roboten kjører over et mønster med striper som et fortau.


%% Initialiserer NXT
COM_CloseNXT all                % lukker alle NXT-håndtak 
close all                       % lukker alle figurer  
clear all                       % sletter alle variable 
handle_NXT = COM_OpenNXT();     % etablerer nytt håndtak
COM_SetDefaultNXT(handle_NXT);	% setter globalt standard-håndtak

%% Initialiser/åpne sensorer

OpenLight(SENSOR_3,'ACTIVE');



%% Initialiserer motor A

motorC= NXTMotor('C','SmoothStart',true); % initialiserer motor C
motorB= NXTMotor('B','SmoothStart',true);

%% Initialiserer joystick
joymex2('open',0);                     % åpner joystick
joystick      = joymex2('query',0);    % spør etter data fra joystick
JoyMainSwitch = joystick.buttons(1);   % henter verdien fra mainswitch 


%% Definerer vektorer 

Lys = zeros(1,10000000);
% Utganger
PowerC = zeros(1,1000000);  %  motorpådrag
PowerB = zeros(1,100);

% Egendefinerte vektorere
JoyForover = zeros(1,1000000);  % lagrer joystickdata
lysfiltrert = zeros(1,100000000);

%% index for lagring i vektorer
i=1;

%% Variabler for Hastighet og lengdemåling
Farten = 0; % Test målinger med forskjellig hastighet - Skal justeres vha. knapper på joystick eller GUI
 Tellestatus = false; % Blir true når den kan telle en puls
    Lengdeteller = 0;
    Kjorelengde = 0;
    tic
while ~JoyMainSwitch
   
    %% få tak i joystickdata
    joystick        = joymex2('query',0);       % spør etter data fra joystick
    JoyMainSwitch   = joystick.buttons(1);
    JoyForover(i)   = -joystick.axes(2)/850; % 32768 fremover, -32768 bakover
    JoySide(i)      =-joystick.axes(1)/850;
    
    Lys(i) = GetLight(SENSOR_3);
    lysfiltrert(i)= % Skal hentes ut fra en annen fil, ikke implementert enda
       
    
    %% Motorpådrag og beregning av kjørelengde/lengdeteller
    
    if farten = 0
        PowerB=15;
        PowerC=15;
    elseif farten = 1
        PowerB=20;
        PowerC=20;
    elseif farten = 2
        PowerB=25;
        PowerC=25;
    elseif farten = 3 % Turbo
        PowerB=40;
        PowerC=40;
    end
    
    if lysfiltrert(i) < 45
        NXT_PlayTone(500,500); % Spiller en tone for testing - hører forskjell når den kommer over/under lysgrense
        if Tellestatus == true % Når tellestatus går til sann, så teller vi en ny "puls"
            Lengdeteller = Lengdeteller + 1; % Plusser på en på teller når vi får en "puls"
        end
        Tellestatus = false % Når vi har talt +1, så setter vi pulsen til "false" igjen.
        
    end
    
    if lysfiltrert(i) >= 45 
        NXT_PlayTone(300,500); % Spiller en tone for testing - hører forskjell når den kommer over/under lysgrense
        Tellestatus = true
        
    end
    
  
   
   % Beregne antall cm kjørt
   Kjorelengde = Lengdeteller * 26 / 10;
   disp (Kjorelengde)
       
        
        
    
    %% set output data
    motorC.Power = floor(PowerC);
    motorC.SendToNXT();
    motorB.Power = floor(PowerA);
    motorB.SendToNXT();
    
    % oppdaterer tellevariabel
    i=i+1;
   
end

Stoppeklokke = toc;

 % Beregne antall cm kjørt
Kjorelengde = Lengdeteller * 26; %26mm per puls
disp (Kjorelengde)
disp(Stoppeklokke)

Fart = (Kjorelengde / 1000000) / (Stoppeklokke) * 3600; % mm til km delt på stoppeklokke * 3600sek(1time)
disp(Lengdeteller)
disp(Fart)

%% stopp motorer
motorC.Stop;
motorB.Stop;

% Clear MEX-file to release joystick
clear joymex2

% Steng ned sensorer
CloseSensor(SENSOR_3);

% Close NXT connection.
COM_CloseNXT(handle_NXT);
