%Author: Lucas Zenichi Terada
%Description: A função tem como objetivo retornar um vetor com os coeficientes 
%da regressão linear dos pontos passados como parâmetro na função, o retorno é
%uma matriz do formato [coeficiente linear; coeficiente angular]

%OBSERVAÇÃO: Os parâmetros devem ser passados como uma matriz linha

function [coef] = linear_regression (x, y,opt)
  length_y = length(y);
  length_x = length(x);
  comand = 0;
  if exist('opt', 'var')
        comand = opt;
  end
  %Imprime mensagem de erro para parâmetros de dimensões diferentes
  if length_x != length_y
    disp("Fatal error: Matrizes do parâmetro possuem tamanhos diferentes")
  else
    array_1 = ones(length_x,1);     %Matriz de 1's para determinar coeficiente ang
    X = transpose(x);               %Correção da matriz para matriz coluna
    Y = transpose(y);               %Correção da matriz para matriz coluna
    X = array_1 * [1 0] + X*[0 1];  %Cria a matriz corrigida
    coef = inv(transpose(X)*X)*transpose(X)*Y;    
    if comand == "verbose"
      disp("coef(1) = coeficiente linear");
      disp("coef(2) = coeficiente angular");
    end
  end
    
endfunction

