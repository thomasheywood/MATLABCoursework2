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

Temp= (V-0.5)*100;
x = 1:duration;
plot(x,Temp);
xlabel('Time (s)','Interpreter','latex')
ylabel('Temperature ($^{o}$C)','Interpreter','latex')

%d)


%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
clear
% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]
clear
% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]
clear
% Insert answers here