# Carregando o arquivo de �udio
file = 'som.mat';
load(file);
# Declarando Vari�veis
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
## Declarando Vari�veis
energy = 0;
i = 1;
ts=1/fs;
## Loop para realizar o somat�rio
while i < length(x)
  inicial_energy = (abs(x(i)))^2;
  energy += inicial_energy;
  i++;
end
energy;


# Somatorio da IV

# Decalara��o do vetor para armazenamento dos valores de sa�da
vetor_y = [];

# La�o de repeti��o para realiza��o dos c�lculos
for n = 1:length(x)
  # Reset do valor de somat�rio para a realiza��o da pr�xima conta
  somatorio = 0;
  # Segundo la�o de repeti��o para realiza��o do somat�rio
  for i = -10:10
    # Condi��o para caso o valor de n-i esteja fora da indexa��o do vetor
    if n-i <= 0 || n-i > length(x)
      x_inicial = 0;
    else
      x_inicial = x(n-i);
    end
    somatorio += x_inicial;
  end
  # C�lculo do valor de sa�da daquela amostra
  y = (1/10) * somatorio;
  # Armazenamento do valor obtido em um vetor para a plotagem do gr�fico
  vetor_y = [vetor_y, y];
end

# Cria��o de um vetor para a plotagem do gr�fico
m = 0:length(vetor_y)-1;

# Plot do gr�fico de sa�da
figure;
subplot(1,1,1)
plot(m, vetor_y, '.b')
grid on
xlabel('Amostras Final')
ylabel('Sinal')








