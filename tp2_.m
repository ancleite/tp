clear all
close all
# Carregando o arquivo de áudio
file = 'som2.wav';
info = audioinfo(file);
[x, fs] = audioread(file);
Ts = 1/fs;
tfinal = Ts*length(x);
# Escutando o áudio
soundsc(x, fs, 16)


# Plot do gráfico do sinal de entrada no domínio do tempo
figure;
t = linspace(0,tfinal, length(x));
subplot(1,1,1)
index = 1:length(x);
plot(index, x, '.b')
hold on
plot(index, x,'-rb')
grid on
xlabel('Amostras')
ylabel('Sinal')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Domínio da Frequência
# Cálculo do FFT
function [X, freq] = plot_fft (x, fs, logscale=false, viewfase=true)
   
  N = length(x);  
  T = N/fs; % período
  freq = linspace(0,N,N)/T; # vetor de frequências
  X = fftn(x)/N; #Vetor da resposta em frequência de x
  fc = ceil(N/2); % para ajustar os dados do vetor
  X = 2*X(1:fc); #Vetor da resposta em frequência de x
 
  if viewfase % visualização da fase
    subplot(2,1,1)
  end 
  if logscale
    plot(freq(1:fc), 20*log10(abs(X*N)));
    ylabel('20log|X|')
  else
    plot(freq(1:fc), abs(X));
    ylabel('|X|')
  end
  title('Análise de Fourier')
  xlabel('freq (Hz)')
  grid on
   
  if viewfase
    subplot(2,1,2)
    plot(freq(1:fc), 180/pi*atan2(imag(X), real(X)),'-rb');
    ylabel('fase')
    xlabel('freq (Hz)')
    grid on 
  end
end

fs = 44100; #Frequencia de amostragem
n = -100:1/fs:100;
 
figure
[X,f] = plot_fft(x,fs);
axis([0 500 0 max(abs(X))])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#Análise de pequenas amostras do sinal de entrada
# Vetor para armazenar as amostras
z = [];
for g = 6725:9500
  z = [z, x(g)];
end
#Plotagem do Gráfico do corte de amostras
figure;
j = 6725:9500;
subplot(1,1,1)
plot(j, z,'-rb')
grid on
xlabel('Amostras')
ylabel('Sinal')

#Realização da FFT
fs = 44100;
n = -100:1/fs:100;
N = length(x);
 
figure
[X,f] = plot_fft(z,fs);
axis([0 1000 0 max(abs(X))])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#Convolução
# Declaração de variáveis
omega_c1 = 0.05699034292;
omega_c2 = 0.07123792865;
sinal_convolucao = [];
h = [];
for n = 1:400
  #Variáveis da fórmula do sinal de resposta ao impulso
   x_1 = (omega_c1 * (n - 200));
   x_2 = (omega_c2 * (n - 200));
   #Resposta ao impulso
   h(n) = ((omega_c1 / pi) * pi * sinc(x_1/pi) )...
    - ((omega_c2 / pi) * pi * sinc(x_2/pi) );
end

#Laço de repetição para construir o vetor de resposta ao impulso
for n = 1:5000
  y = 0;
  #Laço de repetição para realizar a concolução
  for m = 0:n
    if(n-m+1) <= 400
      #Realização da convolução
      somatorio = h(n-m+1) * x(m+1);
      y += somatorio;
    endif
  endfor
  sinal_convolucao = [sinal_convolucao, y];
end
s = conv(x, h);

figure;
j = 0:length(sinal_convolucao)-1;
subplot(1,1,1)
plot(j, sinal_convolucao,'-rb')
grid on
xlabel('Amostras')
ylabel('Sinal')
soundsc(s, fs, 16)

figure;
j = 0:length(s)-1;
subplot(1,1,1)
plot(j, s,'-rb')
grid on
xlabel('Amostras')
ylabel('Sinal')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#Domínio da Frequência do sinal de saída
figure
[X,f] = plot_fft(sinal_convolucao,fs);
axis([0 800 0 max(abs(X))])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#Análise de pequenas amostras do sinal de saída
# Vetor para armazenar as amostras
z = [];
for g = 3200:4800
  z = [z, sinal_convolucao(g)];
end
#Plotagem do Gráfico do corte de amostras
figure;
j = 3200:4800;
subplot(1,1,1)
plot(j, z,'-rb')
grid on
xlabel('Amostras')
ylabel('Sinal')
#Realização da FFT
fs = 44100;
n = -100:1/fs:100;
N = length(x);
 
figure
[X,f] = plot_fft(z,fs);
axis([0 1000 0 max(abs(X))])
