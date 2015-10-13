% beregner hvordan joystickdata skal brukes for 
% å få motorene til å bevege seg

if online 
    if PID(k) >= (100-fart) 
        PID(k) = (100-fart);
    elseif PID(k) < -(100-fart)
        PID(k) = -(100-fart)
    end

    motorA.Power = fart - PID(k);
    motorA.SendToNXT();
    motorC.Power = fart + PID(k);
    motorC.SendToNXT();
    PowerA(k) = motorA.Power;
    PowerC(k) = motorC.Power;
   

else
    pause(0.01) % simulerer NXT-Matlab kommunikasjon i online=0
end
