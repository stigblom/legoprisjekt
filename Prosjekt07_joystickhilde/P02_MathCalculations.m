
Ts(k-1) = Tid(k)- Tid(k-1);
avvik(k) = Lyd(k)- nullpunkt;
LydIntergrert(k) = Lyd(k-1)+avvik(k-1)*Ts(k-1) ;
LydFiltrert(k) = FIR_filter(Lyd(1:k),m); 
round(LydFiltrert);
    
