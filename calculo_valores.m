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

for i=1:4
    
    Parmadura_3(i) = Vta_3*Ia_3(i);
    Pra_3(i) = Ra*Ia_3(i);
    Pem_3(i) = Parmadura_3(i) - Pra_3(i);
    Peixo_3(i) = Pem_3(i) - Protacional(i);
    
    Tem_3(i) = Pem_3(i)/W_eixo3(i);
    Teixo_3(i) = Peixo_3(i)/W_eixo3(i);
    
end

