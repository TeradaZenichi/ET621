%Plot csv file

file = csvread('TEK0000_edited.CSV');
plot(file(:,1),file(:,2))
xlim([0 15]);
ylabel('Tensão [v]');
xlabel('Tempo [s]');