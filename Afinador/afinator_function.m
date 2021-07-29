function [Y] = afinator_function (x, fs, fc1, fc2, freq_note)
  ts = 1/fs; % tempo do sinal
  N0 = length(x); % tamanho do sinal de entrada
  n = 0:N0-1; % quantidade de amostras
  

  nn = -N0/2:N0/2 - 1;
  h1 = 2*fc1/fs*sinc(2*fc1/fs*nn); % filtro na frequência de corte 1
  h2 = 2*fc2/fs*sinc(2*fc2/fs*nn); % filtro na frequência de corte 2
  h = h2 - h1; % filtro utilizado


  y = conv(x, h, 'same'); % realização da convolução do sinal de entrada com o filtro

  [Y, freqY] = plot_fft(y, fs); % espectro do sinal convoluído
  [m,idx]=findpeaks(abs(Y), "MinPeakHeight", max(abs(Y)/4)); % encontrar os picos do espectro do sinal convoluídos

  afinado = cos(2*pi*freq_note*n*ts)*max(abs(Y)); % sinal afinado na frequência da nota
  [afinado_fft, freqafinado] = plot_fft(afinado, fs); % espectro do sinal afinado

  % Plotagem da comparação do sinal de áudio captado e do sinal afinado
  figure
  fc = ceil(N0/2);
  plot(freqafinado(1:fc), abs(afinado_fft))
  hold on
  plot(freqY(1:length(Y)), abs(Y), freqY(idx), abs(Y(idx)), 'xm')
  grid on
  xlabel('Freq (Hz)')
  ylabel('|Sinal|')
endfunction

