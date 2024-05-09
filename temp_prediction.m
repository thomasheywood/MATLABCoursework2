% Thomas Heywood
% egyth4@nottingham.ac.uk
clear
close all
clc
a = arduino("COM7", "Uno");

function temp_pred

dTemp = 0;
range = [20, 25];
time = 1;
time_prediction = 5;

while true
    V = readVoltage(a, "A0");
    Temp = (V-0.5)*100;

    Temp0 = Temp - dTemp * time;
    dTemp = (Temp - Temp0) / time; %change in temperature per minute
    next_temp = Temp + dTemp * time_prediction;

    fprintf ('Temp is %.2f degrees C/n', Temp)
    fprintf('Rate of change is %.2f degrees C/s/n', dTemp)
    fprintf('Time in %d minutes is %.2f degrees C/n', time_prediction, next_temp)
    
    if dTemp > 4
        writeDigitalPin(a, 'D2',1) %red light
    elseif dTemp < -4
        writeDigitalPin(a, 'D3',1) %yellow light
    else
        writeDigitalPin(a, 'D4',1) %green light
    end
end
%This code builds off temp_monitor.m and calculates predicted change in
%cabin temperature and displays warning lights based off its prediction in
%the next 5 minutes, or any time you set time_prediction to.
end