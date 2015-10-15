% beregner hvordan joystickdata skal brukes for 
% å få motorene til å bevege seg


if online 
    Drive=8;



if LydFiltrert(k) <300 && LydFiltrert(k) > 200
        
         motorA.Power = Drive ;
         motorA.SendToNXT();
         motorC.Power = Drive;
         motorC.SendToNXT();
         
        
elseif LydFiltrert(k) <400 && LydFiltrert(k) > 300
        
        motorC.Stop 
        motorC.SendToNXT();
        motorA.Stop
        motorA.SendToNXT();
        motorA.Power=Drive;
        motorA.SendToNXT();
       
       

%          motorA.Power =Stopp ;
%          motorA.SendToNXT();
        
elseif LydFiltrert(k) <1023 && LydFiltrert(k) > 400
      
        motorC.Stop 
        motorC.SendToNXT();
        motorA.Stop
        motorA.SendToNXT();
        
        
end     
 else  
    pause(0.01) % simulerer NXT-Matlab kommunikasjon i online=0
end
       
