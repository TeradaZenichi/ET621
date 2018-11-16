%Determinação da curva de regulação

Vt = [186 220 171.6 159 131.7 101];
Ia = [1.6 1.9 2.2 2.7 3.2 3.7 ];
figure(5)
plot(Ia,Vt, 'Linewidth',2)
xlabel('I_{a} [A]', 'fontsize', 15)
ylabel('V_{t} [V]', 'fontsize', 15)
set(gca,'fontsize',15, 'ygrid', 'on', 'xgrid', 'on'); 
print -djpg fig5.jpg
