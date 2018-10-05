clear all
clc
close all
%Plot da curva de corrente no estator versus velocidade do rotor
I = [4.9 5.1 5.7];
n = [1786 1781 1769];
w = (n*pi)/30;

figure(1)
grid on;
plot(w,I,w,I,'sb')
xlabel('Velocidade angular do rotor [rad/s]');
ylabel('Corrente do estator [A]');

%Plot da curva do torque de eixo versus velocidade do rotor
P = [600 751 1206];
P_eixo = P - 330;
T_mec = P./w;
T_eixo = P_eixo./w;
figure(2)
grid on;
plot(w,T_eixo,w,T_eixo,'sb')
xlabel('Velocidade angular do rotor [rad/s]');
ylabel('Torque do eixo [N.m]');

%Determinação dos parâmetros com base nos ensaios
%Dados a vazio
Vfnl = 224.6/sqrt(3);
Inl = 4.7;
Pnl = 330;
%Dados com rotor bloqueado
Vfbl = 65.6/sqrt(3);
Ibl = 9;
%Pbl = 662;
Pbl = 380;

X1 = (sqrt((Vfbl/Ibl)^2 - (Pbl/(3*Ibl^2))^2))/2;
X2_linha = X1;
Xm = sqrt((Vfnl/Inl)^2 - (Pnl/(3*Inl^2))^2) - X1;
R1 = 0.75; %medido
R2_linha = Pbl/(3*Ibl^2) - R1;

%Determinação dos equivalentes de Thevenin
V1 = 225/sqrt(3);
Vth = Xm/(sqrt(R1^2+(X1+Xm)^2)) * V1;
Rth = (Xm^2)*R1/(R1^2+ (Xm + X1)^2);
Xth = Xm*(Xm*X1+X1^2+R1^2)/(R1^2+(Xm+X1)^2);
Zth = (i*Xm*(R1+i*X1))/(i*Xm + R1+i*X1);


%Curva de corrente de armadura versus velocidade de rotação
ws = 1800*pi/30;
s = 1:-0.01:0.01;
w_eixo = ws-s*ws;
for k = 1:100
  %Z = sqrt((Rth+R2_linha/s(k))^2 + (Xth + X2_linha)^2);
  Z = abs(Zth + R2_linha/s(k) + i*X2_linha);
  Ia(k) = Vth/Z;
end
figure(3)
grid on;
plot(w_eixo,Ia)
xlabel('Velocidade angular do rotor [rad/s]');
ylabel('Corrente de armadura [A]');

%Curva teórica de conjugado versus velocidade de rotação
for k = 1:100
  T(k) = (3/((1800*pi/30)*s(k)))*(R2_linha*Vth^2)/((Rth + R2_linha/s(k))^2 + (Xth+X2_linha)^2);
end
figure(4)
grid on;
plot(w_eixo,T);
xlabel('Velocidade angular do rotor [rad/s]')
ylabel('Torque de eixo [N.m]')

%Plot da curva de I(w) obtida e teórica
figure(5)
grid on;
plot(w_eixo,Ia)
hold on
plot(w,I)
legend('Curva teórica','Curva Experimental');
xlabel('Velocidade angular do rotor [rad/s]');
ylabel('Corrente de armadura [A]');

figure(6)
grid on;
plot(w_eixo,T)
hold on
plot(w,T_mec)
legend('Curva teórica','Curva Experimental')
xlabel('Velocidade angular do rotor [rad/s]')
ylabel('Torque de eixo [N.m]')
