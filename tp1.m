# Carregando o arquivo de áudio
file = 'som.mat';
load(file);
# Declarando Variáveis
fs = 44100;
tfinal = length(x)*(1/fs);

# Criar um vetor para substituir o tempo pelas amostras (index)
index = [];
for i = 1:length(x)
  index = [index, i];
end

# Plot
figure;
subplot(1,1,1)
plot(index,x,'.b')
grid on
xlabel('Amostras')
ylabel('Sinal')

# Somatorio de energia
## Declarando Variáveis
energy = 0;
i = 1;
ts=1/fs;
## Loop para realizar o somatório
while i < length(x)
  inicial_energy = (abs(x(i)))^2;
  energy += inicial_energy;
  i++;
end
energy;


# Somatorio da IV

# Decalaração do vetor para armazenamento dos valores de saída
vetor_y = [];

# Laço de repetição para realização dos cálculos
for n = 1:length(x)
  # Reset do valor de somatório para a realização da próxima conta
  somatorio = 0;
  # Segundo laço de repetição para realização do somatório
  for i = -10:10
    # Condição para caso o valor de n-i esteja fora da indexação do vetor
    if n-i <= 0 || n-i > length(x)
      x_inicial = 0;
    else
      x_inicial = x(n-i);
    end
    somatorio += x_inicial;
  end
  # Cálculo do valor de saída daquela amostra
  y = (1/10) * somatorio;
  # Armazenamento do valor obtido em um vetor para a plotagem do gráfico
  vetor_y = [vetor_y, y];
end

# Criação de um vetor para a plotagem do gráfico
m = 0:length(vetor_y)-1;

# Plot do gráfico de saída
figure;
subplot(1,1,1)
plot(m, vetor_y, '.b')
grid on
xlabel('Amostras Final')
ylabel('Sinal')








