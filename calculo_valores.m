close all
clear all

% MAQUINA A VAZIO            

%Ia_vazio = [1.086, 1.295, 1.242];
%Vta_vazio = [200, 200, 180];
%Ra = 2;
%W_eixo = (pi/30).*[1537, 1776, 1599];

%Parmadura_vazio = Vta_vazio*Ia_vazio;
%Pra_vazio = Ra*Ia_vazio^2;
%Pem_vazio = Parmadura_vazio - Pra_vazio;
%Protacional_vazio = Pem_vazio;
%Peixo_vazio = Pem_vazio - Protacional_vazio;

%Tem_vazio = Pem_vazio/W_eixo;
%Teixo_vazio = Peixo_vazio/W_eixo;



% MAQUINA COM Vta = 200V e I_f = 0.4A

Vta_1 = 200;
Ia_1 = [3.136 2.083 1.964 1.086];
Ra = 2;
W_eixo1 = (pi/30).*[1478 1488 1508 1537];

Parmadura_vazio_1 = Vta_1*Ia_1(4);
Pra_vazio_1 = Ra*Ia_1(4)^2;
Protacional_vazio_1 = Parmadura_vazio_1 - Pra_vazio_1;
Pcarga_1 = [359.4 179.6 119.5];

for i=1:4
    
    Parmadura_1(i) = Vta_1*Ia_1(i);
    Pra_1(i) = Ra*Ia_1(i);
    Pem_1(i) = Parmadura_1(i) - Pra_1(i);
    Peixo_1(i) = Pem_1(i) - Protacional_vazio_1;
    
    Tem_1(i) = Pem_1(i)/W_eixo1(i);
    Teixo_1(i) = Peixo_1(i)/W_eixo1(i);
    
end

% MAQUINA COM Vta = 200V e I_f = 0.3A

Vta_2 = 200;
Ia_2 = [3.346 2.307 1.964 1.295];
Ra = 2;
W_eixo2 = (pi/30).*[1730 1752 1759 1776];

Parmadura_vazio_2 = Vta_2*Ia_2(4);
Pra_vazio_2 = Ra*Ia_2(4)^2;
Protacional_vazio_2 = Parmadura_vazio_2 - Pra_vazio_2;
Pcarga_2 = [356.3 179.8 119.4];

for i=1:4
    
    Parmadura_2(i) = Vta_2*Ia_2(i);
    Pra_2(i) = Ra*Ia_2(i);
    Pem_2(i) = Parmadura_2(i) - Pra_2(i);
    Peixo_2(i) = Pem_2(i) - Protacional_vazio_2;
    
    Tem_2(i) = Pem_2(i)/W_eixo2(i);
    Teixo_2(i) = Peixo_2(i)/W_eixo2(i);
    
end

%TODO
% MAQUINA COM Vta = 180V e I_f = 0.3A

Vta_3 = 180;
Ia_3 = [3.569 2.334 1.976 1.242];
Ra = 2;
W_eixo3 = (pi/30).*[1554 1575 1579 1599];

Parmadura_vazio_3 = Vta_3*Ia_3(4);
Pra_vazio_3 = Ra*Ia_3(4)^2;
Protacional_vazio_3 = Parmadura_vazio_3 - Pra_vazio_3;
Pcarga_3 = [358.4 176 116.3];

for i=1:4
    
    Parmadura_3(i) = Vta_3*Ia_3(i);
    Pra_3(i) = Ra*Ia_3(i);
    Pem_3(i) = Parmadura_3(i) - Pra_3(i);
    Peixo_3(i) = Pem_3(i) - Protacional_vazio_3;
    
    Tem_3(i) = Pem_3(i)/W_eixo3(i);
    Teixo_3(i) = Peixo_3(i)/W_eixo3(i);
    
end

coefs(1,:) = linear_regression(Tem_1, W_eixo1);
coefs(2,:) = linear_regression(Tem_2, W_eixo2);
coefs(3,:) = linear_regression(Tem_3, W_eixo3);
b1 = coefs(1,1);
a1 = coefs(1,2);
b2 = coefs(2,1);
a2 = coefs(2,2);
b3 = coefs(3,1);
a3 = coefs(3,2);
figure();
t=0:1:10;
plot(t,a1*t+b1, 'Linewidth', 3);
hold on;
grid on;
plot(t,a2*t+b2, 'Linewidth', 3);
plot(t,a3*t+b3, 'Linewidth', 3);
xlabel("T_{em} [N.m]");
ylabel('\omega_{eixo} [rad/s]');
legend('V_{ta}=200V, I_f=0.4A', 'V_{ta}=200V, I_f=0.3A', 'V_{ta}=180V, I_f=0.3A');


coefs(1,:) = linear_regression(W_eixo1, Peixo_1);
coefs(2,:) = linear_regression(W_eixo2, Peixo_2);
coefs(3,:) = linear_regression(W_eixo3, Peixo_3);
b1 = coefs(1,1);
a1 = coefs(1,2);
b2 = coefs(2,1);
a2 = coefs(2,2);
b3 = coefs(3,1);
a3 = coefs(3,2);
figure();
t=0:1:10;
plot(t,a1*t+b1, 'Linewidth', 3);
hold on;
grid on;
plot(t,a2*t+b2, 'Linewidth', 3);
plot(t,a3*t+b3, 'Linewidth', 3);
xlabel('\omega_{eixo} [rad/s]');
ylabel('P_{eixo} [W]');
legend('V_{ta}=200V, I_f=0.4A', 'V_{ta}=200V, I_f=0.3A', 'V_{ta}=180V, I_f=0.3A');

#Grafico P_carga x w_eixo
coefs(1,:) = linear_regression(W_eixo1(1:3), Pcarga_1);
coefs(2,:) = linear_regression(W_eixo2(1:3), Pcarga_2);
coefs(3,:) = linear_regression(W_eixo3(1:3), Pcarga_3);
b1 = coefs(1,1);
a1 = coefs(1,2);
b2 = coefs(2,1);
a2 = coefs(2,2);
b3 = coefs(3,1);
a3 = coefs(3,2);
figure();
t=0:1:10;
plot(t,a1*t+b1, 'Linewidth', 3);
hold on;
grid on;
plot(t,a2*t+b2, 'Linewidth', 3);
plot(t,a3*t+b3, 'Linewidth', 3);
xlabel('\omega_{eixo} [rad/s]');
ylabel('P_{carga} [W]');
legend('V_{ta}=200V, I_f=0.4A', 'V_{ta}=200V, I_f=0.3A', 'V_{ta}=180V, I_f=0.3A');