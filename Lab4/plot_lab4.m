%Plot da curva de corrente no estator versus velocidade do rotor
I = [4.9 5.1 5.7];
n = [1786 1781 1769];
w = (n*pi)/30;

figure(1)
plot(w,I)
xlabel('Velocidade angular do rotor [rad/s]');
ylabel('Corrente do estator [A]');

%Plot da curva do torque de eixo versus velocidade do rotor
P = [600 751 1206];
P_eixo = P - 330;
T_eixo = P_eixo./w;
figure(2)
plot(w,T_eixo)
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
Pbl = 662;

X1 = sqrt((Vfbl/Ibl)^2 - (Pbl/(3*Ibl^2)^2));
X2_linha = X1;
Xm = sqrt((Vfnl/Inl)^2 - (Pnl/(3*Inl^2)^2)) - X1;
R1 = 0.5 %medido
R2_linha = Pbl/(3*Ibl^2) - R1;

%Determinação dos equivalentes de Thevenin
V1 = 225/sqrt(3);
Vth = Xm/(sqrt(R1^2+(X1+Xm)^2)) * V1
Rth = (Xm^2)*R1/(R1^2+ (Xm + X1)^2)
Xth = Xm*(Xm*X1+X1^2+R1^2)/(R1^2+(Xm+X1)^2);

%Curva de corrente de armadura versus velocidade de rotação
ws = 377;
s = 1:-0.01:0.01;
w_eixo = ws-s*ws;
for k = 1:100
  Z = sqrt(Rth^2 + Xth^2+X2_linha^2 + (R2_linha/s(k))^2);
  Ia(k) = Vth/Z;
end
figure(3)
plot(w_eixo,Ia)
xlabel('Velocidade angular do rotor [rad/s]');
ylabel('Corrente de armadura [A]');

%Curva teórica de conjugado versus velocidade de rotação
for k = 1:100
  T(k) = (3/(377*s(k)))*(R2_linha*Vth^2)/((Rth + R2_linha/s(k))^2 + (Xth+X2_linha)^2);
end
figure(4)
plot(w_eixo,T);
xlabel('velocidade angular do rotor [rad/s]')
ylabel('Torque de eixo [N.m]')
