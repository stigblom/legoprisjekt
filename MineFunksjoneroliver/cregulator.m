function utgangsverdi = cregulator(avvik,integral,derivat,P,I,D)
%Regulator for motor C pådrag
%   Detailed explanation goes here
    utgangsverdi = avvik * P + integral * I + derivat * D

end

