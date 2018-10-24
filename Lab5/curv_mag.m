%plot da curva de magnetização

V1 = [40.9 60.2 80.6 100.2 110.7 120.8 130.6 140.6 150.8 160.1 170.3 180.2 190.1 200.8 210.3 220.3 230.5 240.7 250.3];
Iphi = [0.46 0.7 0.95 1.21 1.36 1.5 1.65 1.82 2.0 2.18 2.41 2.67 2.99 3.35 3.74 4.2 4.78 5.4 6.01];


figure(1)
plot(Iphi,V1,Iphi,V1, 'o')

%Operação do gerador de indução auto excitado
C = [30 25 20 15];
V_1 = [219.4 192.1 115.1 7.7];
I1 = [4.2 3.1 1.5 0];
f1 = [59.93 59.93 59.94 60.02];

a = zeros(1,4);
