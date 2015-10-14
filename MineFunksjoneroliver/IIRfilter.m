function filtrert = IIRfilter(lysnaa, tidligerefiltrert)
%IIRFILTER Summary of this function goes here
%   Detailed explanation goes here
    filtrert = (lysnaa*0.6) + (tidligerefiltrert*0.4);

end

