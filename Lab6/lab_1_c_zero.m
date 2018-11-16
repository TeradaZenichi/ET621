close all
clear all 

% Grafico curva de magnetizacao

figure(1)
hold on
Ifm = [0.59 0.57 0.56 0.54 0.52 0.5 0.48 0.46 0.44 0.42 0.4 0.38 0.36 0.34 0.32 0.3 0.28 0.26 0.24 0.22 0.2 0.18 0.16 0.14 0.12 0.10 0.08 0.06 0.04 0.02 0];
Vam = [161.7 160 159.5 158.7 156.67 154.9 152.8 151.1 149.7 147 144.7 141.9 138.9 136.5 133.6 130.6 126.3 122.9 119 113.6 109.7 102 93.6 86.1 77.7 68.6 58.7 46.9 35.5 18.1 10.4];

plot(Ifm,Vam,'s', 'Linewidth',2)
xlabel('I_{f} [A]', 'fontsize', 15)
ylabel('V_{a} [V]', 'fontsize', 15)
set(gca,'fontsize',15, 'ygrid', 'on', 'xgrid', 'on'); 

%Linearização da região linear

I = [0.10 0.08 0.06 0.04 0.02 0];
V = [68.6 58.7 46.9 35.5 18.1 0];
coef = linear_regression(I,V,'verbose')

I = 0:0.01:0.2;
V = coef(1)+coef(2)*I;
plot(I,V,'r','Linewidth', 2)
 

print -djpg fig1_c_zero.jpg






 
