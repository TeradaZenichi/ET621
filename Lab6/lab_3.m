%Script para leitura do CSV

clear all
close all
%=======Primeiro CSV=======%

figure(3)
filename = csvread("TEK0001.CSV");
plot(filename(:,1),filename(:,2),'Linewidth',1.1)
xlim([0 2])
ylim([-0.2 0.2])


xlabel('Time [t]', 'fontsize', 15)
ylabel('Voltage [V]', 'fontsize', 15)
set(gca,'fontsize',15, 'ygrid', 'on', 'xgrid', 'on');
print -djpg fig3.jpg

%=======Segundo CSV=======%

figure(4)
filename = csvread("TEK0002.CSV");
plot(filename(:,1),filename(:,2),'Linewidth',1.1)
xlim([0 2])
ylim([-0.1 0.1])


xlabel('Time [t]', 'fontsize', 15)
ylabel('Voltage [V]', 'fontsize', 15)
set(gca,'fontsize',15, 'ygrid', 'on', 'xgrid', 'on');
print -djpg fig4.jpg
 