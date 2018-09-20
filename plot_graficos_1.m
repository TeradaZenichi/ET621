#Description: O script em questão tem o objetivo de plot o gráfico de velocidade
#de rotação em função da corrente de armadura, considere as seguintes condições:

#Resistência do enrolamento com a máquina quente
ra = 2;
#Va = 200V e If = 0.4A
#Ia_1 = [1.0860 3.1360 2.0830 1.7440];
#n_1 = [1537 1478 1488 1508];
Ia_1 = [3.1360 2.0830 1.7440];
n_1 = [1478 1488 1508];
w_1 = n_1*pi/30;
#############################################################
disp("Coeficientes calculados para Va = 200V e If = 0.4A");
coef_1 = linear_regression(Ia_1, w_1)
disp("Ka*phi baseado no coeficiente linear");
kaphi_1_linear = 200/coef_1(1);
disp(kaphi_1_linear)
disp("Ka*phi baseado no coeficiente angular");
kaphi_1_angular = -ra/coef_1(2);
disp(kaphi_1_angular)
disp(' ')
#############################################################



#Va = 200V e If = 0.3A
#Ia_2 = [1.295 3.340 2.307 1.964];
#n_2 = [1776 1730 1752 1759];
Ia_2 = [3.340 2.307 1.964];
n_2 = [1730 1752 1759];
w_2 = n_2*pi/30;
#############################################################
disp("Coeficientes calculados para Va = 200V e If = 0.3A");
coef_2 = linear_regression(Ia_2, w_2)
disp("Ka*phi baseado no coeficiente linear");
kaphi_2_linear = 200/coef_2(1);
disp(kaphi_2_linear)
disp("Ka*phi baseado no coeficiente angular");
kaphi_2_angular = -ra/coef_2(2);
disp(kaphi_2_angular)
disp(' ')
#############################################################

#Va = 180V e If = 0.3A
#Ia_3 = [1.242 3.569 2.334 1.976];
#n_3 = [1599 1554 1575 1579];
Ia_3 = [3.569 2.334 1.976];
n_3 = [1554 1575 1579];
w_3 = n_3*pi/30;
#############################################################
disp("Coeficientes calculados para Va = 180V e If = 0.3A");
coef_3 = linear_regression(Ia_3, w_3)
disp("Ka*phi baseado no coeficiente linear");
kaphi_3_linear = 180/coef_3(1);
disp(kaphi_3_linear)
disp("Ka*phi baseado no coeficiente angular");
kaphi_3_angular = -ra/coef_3(2);
disp(kaphi_3_angular)
disp(' ')
#############################################################

#Cria o vetor para plot do gráfico no ambiente do matlab
t = 0:0.01:5;

#valores da função linear para os pontos definido no vetor t
y_1 = coef_1(1) + coef_1(2)*t;
y_2 = coef_2(1) + coef_2(2)*t;
y_3 = coef_3(1) + coef_3(2)*t;

#plot do gráfico
figure()
plot(t,y_1,'Linewidth', 3)
hold on
plot(t,y_2,'Linewidth', 3)
hold on
plot(t,y_3,'Linewidth', 3)
grid on
scatter(Ia_1,w_1);
hold on
scatter(Ia_2,w_2);
hold on
scatter(Ia_3,w_3);
hold on
#title('Gráfico de velocidade angular do eixo versus corrente de armadura')
legend('V_{a} = 200V e I_{f} = 0.4A', 'V_{a} = 200V e I_{f} = 0.3A', 'V_{a} = 180V e I_{f} = 0.3A')
xlabel('I_{a} [A]');
ylabel('\omega_{eixo} [rad/s]')

