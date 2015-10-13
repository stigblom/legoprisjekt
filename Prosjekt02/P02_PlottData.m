
% plotter data
subplot(4,1,1)
plot(Tid(1:k),nullp(1:k),'g-',Tid(1:k),Lys(1:k),'b-',Tid(1:k),LysFiltrert(1:k),'r-');        
title('Nullpunkt, lyssignal og filtrert lyssignal')

subplot(4,1,2)
plot(Tid(1:k),nulll(1:k),Tid(1:k),LysIntegrert(1:k));        
title('Lyssignal integrert rundt null')

subplot(4,1,3)
plot(Tid(1:k-1),LysDerivert(1:k-1));        
title('Derivert av filtrert lyssignal')

subplot(4,1,4)
plot(Tid(1:k-1),LysDerivert(1:k-1));        
title('Derivert av filtrert lyssignal') %skal være piler

% tegn nå (viktig kommando)
drawnow

