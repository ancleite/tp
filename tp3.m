clear all
close all

# Carregando o sinal
file = 'som3.mat';
load(file);

# i) Implementar a Transformada de Fourier Discreta



# Plotagem do gr�fico do sinal
n = 1:2048;
figure
stem(n, x)
xlabel('Amostra')
ylabel('x')

# Transformada de Fourier Discreta

omega = -pi:0.001:pi; # Intervalo do omega 
X = [];
tic

# Realiza��o da Transformada
for omegai=omega
  Xi = 0;
  for ni = 1:2048
    Xi += x(ni) * exp(-j * ni * omegai);
  endfor
  X = [X, Xi];
endfor
tempo = toc # Tempo de execu��o

# ii) Analisar o sinal no dom�nio da frequ�ncia. Visualize corretamente os dados da 
#     Transformada de Fourier Discreta (espectro e fase) desse sinal.

# Plotagem do gr�fico do espectro e fase do sinal

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
#      ao utilizar a fun��o FFT do programa num�rico (valores e tempo de execu��o)

# Vetor omega para realizar a plotagem do sinal FFT.
   # pi foi multiplicado por 0.325907065 para que os vetores possu�ssem os mesmos
   # tamanhos para plotagem do gr�fico.
omegaii = -0.325907065*pi:0.001:0.325907065*pi;
tic
I = fftn(x)/length(x);
tempo3 = toc # Tempo de Execu��o

# Plotagem do gr�fico do espectro e fase do sinal
figure
subplot(2,1,1)
plot(omegaii, fftshift(abs(I)))
xlabel('\Omega')
ylabel('|X|')
subplot(2, 1, 2)
plot(omegaii, fftshift(atan2(imag(I) , real(I))))
xlabel('\Omega')
ylabel('<X')

# B�nus) Implementar uma vers�o da FFT, explicar o seu funcionamento e comparar com a
#        fun��o do programa num�rico.
   
#Declara��o de vari�veis
N_0 = length(x); #N�mero de amostras
Omega_0 = (2*pi) / N_0; #Frequ�ncia fundamental
W = exp(-j * Omega_0); 
n_b = 0:N_0-1;

Xr = [];

tic
#Somat�rio da f�rmula
for r = 0:N_0 - 1
  Xi_b = 0;
  for ni_b = n_b
    #Realiza��o da opera��o
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

# OBS: As informa��es do racioc�nio por tr�s do desenvolvimento do
#      c�digo estar� presente no texto final.