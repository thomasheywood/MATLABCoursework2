% Thomas Heywood
% egyth4@nottingham.ac.uk

%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]
clear 
% a) done
% b) done
% c)
clear a

a = arduino("COM7", "Uno");

for x=1:10
    writeDigitalPin(a, 'D8',1)
    pause (1)
    writeDigitalPin(a, 'D8',0)
    pause (1)
end

%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
clear
close all
clc

a = arduino("COM7", "Uno");

duration = 600;

V = zeros(duration,1);
Temp = zeros(duration,1);

for d = 1:duration
    V(d) = readVoltage(a, 'A0');
    pause(0.001);
    %pause(1) to last for 10 mins
end

Temp = (V-0.5)*100;
x = 1:duration;
plot(x,Temp);
xlabel('Time (s)','Interpreter','latex')
ylabel('Temperature ($^{o}$C)','Interpreter','latex')

%d)


%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
clear
% a) done
clear
close all
clc

a = arduino("COM7", "Uno");

 time = 0;


while true %while loop so that it runs indefinitely
    V = readVoltage(a, 'A0');
    pause(1); %checks temp every second
    if V < 0.68 % voltage associated with 18 degrees
          writeDigitalPin(a, 'D3',1)
          pause (0.5)
          writeDigitalPin(a, 'D3',0)
          pause (0.5)
    end
    if V > 0.74 %voltage associated with 24 degrees
          writeDigitalPin(a, 'D2',1)
          pause (0.25)
          writeDigitalPin(a, 'D2',0)
          pause (0.25)
    end
    if (0.68 <= V) && (V <= 0.74) %voltages between 18 and 24 degrees
     writeDigitalPin(a, 'D4',1)
    end
    if (0.68 >= V) && (V >= 0.74)
      writeDigitalPin(a, 'D4',0)  %turns the green LED off again (Q2e) 
    end

    T = (V-0.5)*100;
    time = time + 1;
    x = 0 : time;  
    pause(1)
    an = animatedline(time,T);
    plot(time,T)
    xlabel('Time (s)','Interpreter','latex')
    ylabel('Temperature ($^{o}$C)','Interpreter','latex')
    drawnow
end
doc temp_monitor;
%see temp_monitor.m

%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

doc temp_prediction;

%See temp_prediction.m

%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

%The largest challenge of this piece is the technical work. The coding
%aspect of this work was the bit that I found most difficult to work out
%and implement and is my biggest weakness. This may be due to the fact that
%this is my first time using any equipment like this and I need more
%practice to get my coding up to a good standard. However, practically 
% using the breadboard and arduino was natural to me and came to me very 
% quickly, even though it was my first time.
%In the future, I would definitely improve my knowledge and efficiency with
%functions and loops as this is the largest limitation of my work so far.
