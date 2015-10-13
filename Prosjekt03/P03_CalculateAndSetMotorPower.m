% beregner hvordan joystickdata skal brukes for 
% å få motorene til å bevege seg

if online 
    if PID(k) >= (100-fart) 
        PID(k) = (100-fart);
    elseif PID(k) < -(100-fart)
        PID(k) = -(100-fart)
    end
    % Beregner motorpådrag og lagrer i datavektor
    %PowerA(k) = JoyForover(k)+JoySide(k);
    %PowerC(k) = JoyForover(k)-JoySide(k);
    motorA.Power = fart - PID(k);
    motorA.SendToNXT();
    motorC.Power = fart + PID(k);
    motorC.SendToNXT();
    PowerA(k) = motorA.Power;
    PowerC(k) = motorC.Power;
   
%     if LysDerivert(k) < 3 && LysDerivert(k) > -3
%         motorA.Power = 25;
%         motorA.SendToNXT();
%         motorC.Power = 25;
%         motorC.SendToNXT();
%         PowerA(k) = motorA.Power;
%         PowerC(k) = motorC.Power;
%     elseif LysDerivert(k) < -3 && LysDerivert(k) > -15
%         motorA.Power = 25;
%         motorA.SendToNXT();
%         motorC.Power = 12;
%         motorC.SendToNXT();
%         PowerA(k) = motorA.Power;
%         PowerC(k) = motorC.Power;        
%     elseif LysDerivert(k) > 3 && LysDerivert(k) < 15
%         motorA.Power = 12;
%         motorA.SendToNXT();
%         motorC.Power = 25;
%         motorC.SendToNXT();
%         PowerA(k) = motorA.Power;
%         PowerC(k) = motorC.Power; 
%     elseif LysDerivert(k) < -15
%         motorA.Power = 25;
%         motorA.SendToNXT();
%         motorC.Power = 0;
%         motorC.SendToNXT();
%         PowerA(k) = motorA.Power;
%         PowerC(k) = motorC.Power;
%     else
%         motorA.Power = 0;
%         motorA.SendToNXT();
%         motorC.Power = 25;
%         motorC.SendToNXT();
%         PowerA(k) = motorA.Power;
%         PowerC(k) = motorC.Power;
%     end

else
    pause(0.01) % simulerer NXT-Matlab kommunikasjon i online=0
end
