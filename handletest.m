Y = 0;    
X = 0;
i = 0;
subplot(2,1,1)
h = plot(X,Y)
subplot(2,1,2)
j = plot(X,Y)

while i < 1000
    i = i + 1;
    X(i) = i + 1;
    Y(i) = X(i)^2;
    set(h,'XData',X,'YData',Y)
    set(j,'XData',X,'YData',Y)
    %plot(X(1:i),Y(1:i))
%     set(p,'XData',X,'YData',Y)
%     set(g,'XData',X,'YData',Y)
    %set(j,'XData',X,'YData',Y)
    drawnow
    %pause(0.02)
end