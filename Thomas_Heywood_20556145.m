% Thomas Heywood
% egyth4@nottingham.ac.uk

%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]
clear 
% a) done
% b) done
% c)
clear a

a = arduino("COM7", "Uno");

for i=1:10
    writeDigitalPin(a, 'D8',1)
    pause (1)
    writeDigitalPin(a, 'D8',0)
    pause (1)
end

%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
clear

duration = 600;

x = 0 : 600;

y = x;
plot(x,y);

%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
clear
% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]
clear
% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]
clear
% Insert answers here