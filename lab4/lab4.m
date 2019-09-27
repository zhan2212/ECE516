clear all;
close all;
clc;

%%
load('data_470.mat');
load('data_1000.mat');
load('data_2200.mat');
x = 1:270;

plot(x,data);
hold on;
plot(x,data2);
plot(x,data3);
legend('Gain = 10','Gain = 5', 'Gain = 2');
xlabel('Distance From the Wall (mm)');
ylabel('LED Light (#)');