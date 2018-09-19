#Description: O script em questão tem o objetivo de plot o gráfico de velocidade
#de rotação em função da corrente de armadura, considere as seguintes condições:

#Va = 200V e If = 0.4A
Ia_1 = [1.0860 3.1360 2.0830 1.7440];
n_1 = [1537 1478 1488 1508];
w_1 = n_1*pi/30;
disp("Coeficientes calculados para Va = 200V e If = 0.4A");
coef_1 = linear_regression(Ia_1, w_1)


#Va = 200V e If = 0.3A
Ia_2 = [1.295 3.340 2.307 1.964];
n_2 = [1776 1730 1752 1759];
w_2 = n_2*pi/30;
disp("Coeficientes calculados para Va = 200V e If = 0.3A");
coef_2 = linear_regression(Ia_2, w_2)


#Va = 180V e If = 0.3A
Ia_3 = [1.242 3.569 2.334 1.976];
n_3 = [1599 1554 1575 1579];
w_3 = n_3*pi/30;
disp("Coeficientes calculados para Va = 180V e If = 0.3A");
coef_3 = linear_regression(Ia_3, w_3)

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
#title('Gráfico de velocidade angular do eixo versus corrente de armadura')
legend('V_{a} = 200V e I_{f} = 0.4A', 'V_{a} = 200V e I_{f} = 0.3A', 'V_{a} = 180V e I_{f} = 0.3A')
xlabel('I_{a} [A]');
ylabel('\omega_{eixo} [rad/s]')

