% Nomes: 
%         Lucas Guimarães Braga   RA: 182543
%         Lucas Zenichi Terada    RA: 182775
%         Nícolas F. R. A. Prado  RA: 185142
%         Thiago H. C. da Cruz    RA: 187576



%plot da curva de magnetização

clear all
close all

V1_linha = [40.9 60.2 80.6 100.2 110.7 120.8 130.6 140.6 150.8 160.1 170.3 180.2 190.1 200.8 210.3 220.3 230.5 240.7 250.3];
V1_fase = V1_linha/sqrt(3);
Iphi = [0.46 0.7 0.95 1.21 1.36 1.5 1.65 1.82 2.0 2.18 2.41 2.67 2.99 3.35 3.74 4.2 4.78 5.4 6.01];


figure(1)
grid on
plot(Iphi,V1_fase,Iphi,V1_fase, 'o')
hold off
%Operação do gerador de indução auto excitado
C_delta = (10^(-6))*[30 25 20 15];
C_triangulo = 3*C_delta;
V_1med_linha = [219.4 192.1 115.1 7.7];
V_1med_fase = V_1med_linha/sqrt(3);
I1 = [4.2 3.1 1.5 0];
f1 = [59.93 59.93 59.94 60.02];

a = zeros(1,4);

a = 1./(2*pi*f1.*C_triangulo);
i = 0 : 0.1 : 5;

figure(2)
grid on
hold on
plot(Iphi,V1_fase,Iphi,V1_fase, 'o')
plot(i,a(1)*i)
plot(i,a(2)*i)
plot(i,a(3)*i)
plot(i,a(4)*i)
plot(I1,V_1med_fase,'rs')

hold off