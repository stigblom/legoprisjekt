% Leser inn nye data fra joystick og fra sensorer på NXT

k=k+1;   % øker diskret tellevariabel
if online
    joystick        = joymex2('query',0);    % spør etter data fra joystick
    JoyMainSwitch   = joystick.buttons(1);
    JoyForover(k)   = -joystick.axes(2)/327.68; % 32768 fremover, -32768 bakover
    
    Lys(k) = GetLight(SENSOR_3);    % få tak i ny lysmåling
    Tid(k) = k;                     % DENNE ER EGENTLIG FEIL OG MÅ ENDRES 
else
    if k==numel(Lys)
        JoyMainSwitch=1; % simulerer at joystickbryter trykkes inn
    end
end
