% Nomes: 
%         Lucas Guimarães Braga   RA: 182543
%         Lucas Zenichi Terada    RA: 182775
%         Nícolas F. R. A. Prado  RA: 185142
%         Thiago H. C. da Cruz    RA: 187576

V1_linha = [40.9 60.2 80.6 100.2 110.7 120.8 130.6 140.6 150.8 160.1 170.3 180.2 190.1 200.8 210.3 220.3 230.5 240.7 250.3];
V1_fase = V1_linha/sqrt(3);
Iphi = [0.46 0.7 0.95 1.21 1.36 1.5 1.65 1.82 2.0 2.18 2.41 2.67 2.99 3.35 3.74 4.2 4.78 5.4 6.01];

%V1_linear = [23.614 34.756 46.534 57.850 63.913 69.744 75.402 81.175];
%Iphi_linear = [0.46 0.7 0.95 1.21 1.36 1.5 1.65 1.82];

V1_linear = [0 23.614 34.756 46.534 57.850];
Iphi_linear = [0 0.46 0.7 0.95 1.21];


i = 0:0.01:3;
coef1 = linear_regression(Iphi_linear,V1_linear);
v1 = i*coef1(2);
figure()
plot(Iphi,V1_fase)
hold on
plot(i,v1,'g')
legend('Curva de magnetização', 'Reta tangente a curva')

C_delta = 1/(3*2*pi*59.94*coef1(2))*1000000;
printf("\n Valor do capacitor para configuração delta: %f uF\n", C_delta)



