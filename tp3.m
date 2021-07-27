clear all
close all

# Carregando o sinal
file = 'som3.mat';
load(file);

# i) Implementar a Transformada de Fourier Discreta



# Plotagem do gráfico do sinal
n = 1:2048;
figure
stem(n, x)
xlabel('Amostra')
ylabel('x')

# Transformada de Fourier Discreta

omega = -pi:0.001:pi; # Intervalo do omega 
X = [];
tic

# Realização da Transformada
for omegai=omega
  Xi = 0;
  for ni = 1:2048
    Xi += x(ni) * exp(-j * ni * omegai);
  endfor
  X = [X, Xi];
endfor
tempo = toc # Tempo de execução

# ii) Analisar o sinal no domínio da frequência. Visualize corretamente os dados da 
#     Transformada de Fourier Discreta (espectro e fase) desse sinal.

# Plotagem do gráfico do espectro e fase do sinal

figure
subplot(2,1,1)
plot(omega, abs(X))
xlabel('\Omega')
ylabel('|X|')
subplot(2, 1, 2)
plot(omega, fftshift(atan2(imag(X) , real(X))))
xlabel('\Omega')
ylabel('<X')

# iii) Comparar e analisar os resultados implementado com os resultados obtidos 
#      ao utilizar a função FFT do programa numérico (valores e tempo de execução)

# Vetor omega para realizar a plotagem do sinal FFT.
   # pi foi multiplicado por 0.325907065 para que os vetores possuíssem os mesmos
   # tamanhos para plotagem do gráfico.
omegaii = -0.325907065*pi:0.001:0.325907065*pi;
tic
I = fftn(x)/length(x);
tempo3 = toc # Tempo de Execução

# Plotagem do gráfico do espectro e fase do sinal
figure
subplot(2,1,1)
plot(omegaii, fftshift(abs(I)))
xlabel('\Omega')
ylabel('|X|')
subplot(2, 1, 2)
plot(omegaii, fftshift(atan2(imag(I) , real(I))))
xlabel('\Omega')
ylabel('<X')

# Bônus) Implementar uma versão da FFT, explicar o seu funcionamento e comparar com a
#        função do programa numérico.
   
#Declaração de variáveis
N_0 = length(x); #Número de amostras
Omega_0 = (2*pi) / N_0; #Frequência fundamental
W = exp(-j * Omega_0); 
n_b = 0:N_0-1;

Xr = [];

tic
#Somatório da fórmula
for r = 0:N_0 - 1
  Xi_b = 0;
  for ni_b = n_b
    #Realização da operação
    Xi_b += x(ni_b+1) * W^(ni_b*r);
  endfor
  #Armazenamento no vetor
  Xr = [Xr, Xi_b];
endfor
tempo_b = toc

#Plot
figure
subplot(2,1,1)
plot(omegaii, fftshift(abs(Xr)))
xlabel('\Omega')
ylabel('|X|')
subplot(2, 1, 2)
plot(omegaii, fftshift(atan2(imag(Xr) , real(Xr))))
xlabel('\Omega')
ylabel('<X')

# OBS: As informações do raciocínio por trás do desenvolvimento do
#      código estará presente no texto final.