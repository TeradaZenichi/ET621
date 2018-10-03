function [coef_linear,coef_angular] = regressao_linear (x, y, print)
  length_y = length(y);
  length_x = length(x);
  
  #Imprime mensagem de erro para parâmetros de dimensões diferentes
  if length_x != length_y
    disp("Fatal error: Matrizes do parâmetro possuem tamanhos diferentes")
  else
    array_1 = ones(length_x,1);  #Matriz de 1's para determinar coeficiente ang
    X = transpose(x);           #Correção da matriz para matriz coluna
    Y = transpose(y);           #Correção da matriz para matriz coluna
    X = array_1 * [1 0] + X*[0 1];  #Cria a matriz corrigida
    coef = inv(transpose(X)*X)*transpose(X)*Y; 
    coef_linear = coef(1)
    coef_angular = coef(2)   
  end