% Curva da caracteristica de curto 

figure(2)
hold on
Ifc = [0.07 0.16 0.25 0.34 0.44];
Iac = [1 2 3 4 5];

plot(Ifc,Iac,'Linewidth',2)
xlabel('I_{f} [A]', 'fontsize', 15)
ylabel('I_{a} [A]', 'fontsize',15)
set(gca,'fontsize',15, 'ygrid', 'on', 'xgrid', 'on');
coef = linear_regression(Ifc,Iac,'verbose')
I = 0:0.1:0.5;
I_lin = coef(1)+I*coef(2);
plot(I,I_lin,'r','Linewidth',2)
legend({'Valores medido','valores linearizados'},'Location','southeast')


print -djpg fig2.jpg



