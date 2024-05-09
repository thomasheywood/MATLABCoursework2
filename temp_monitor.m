% Thomas Heywood
% egyth4@nottingham.ac.uk
%% - temp monitor

clear
close all
clc

function temp_mon

a = arduino("COM7", "Uno");

y = 1;

time = 0;
while true
    time = time + 1;
    x = 0 : time;
    pause(1)   
end

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
end
y = temp(x)
temp = (V-0.5)*100
plot(temp)
xlabel('Time (s)','Interpreter','latex')
ylabel('Temperature ($^{o}$C)','Interpreter','latex')
drawnow

%This function takes the voltage of the thermistor on the breadboard and
%converts the data to local temperature of the component. This then sends a
%warning to the "cockpit" on whether the temperature is too high or low and
%needs to be changed.

end
