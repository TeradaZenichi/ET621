% Nomes: 
%         Lucas Guimarães Braga   RA: 182543
%         Lucas Zenichi Terada    RA: 182775
%         Nícolas F. R. A. Prado  RA: 185142
%         Thiago H. C. da Cruz    RA: 187576

%curvas de regulação

V1 = [207 201.1 182.8 157.2];


I1 = [4.4 4.8 6.2 7.0];


f1 = [59.16 58.85 57.84 56.96 ];

V_vazio = [219.4];
I_vazio = [4.2];
f_vazio = [59.93];

plot(I1,V1,'b')
hold on
plot(I1,f1,'r')
hold on
scatter(I_vazio,V_vazio)
hold on
scatter(I_vazio,f_vazio)
legend('V vs I', 'F vs I', 'Tensão a vazio', 'Frequência a vazio')
xlabel('Corrente [A]')
ylabel('Tensao de linha [V] / Frequencia [Hz]')