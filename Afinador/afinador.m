clear all
close all
# Cria��o de uma interface com o usu�rio
user_menu = menu('Escolha uma nota', 'D�', 'R�', 'L�', 'Mi', 'Sol', 'Si')
# Algoritmo dependendo da escolha do usu�rio
switch user_menu
  case 1
    # Carregando o arquivo de �udio
    file = 'do.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequ�ncias
    fc1 = 257; # freq de corte 1
    fc2 = 277; #freq de corte 2
    freq_note = 267; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #fun��o do afinador
  case 2
    # Carregando o arquivo de �udio
    file = 're.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequ�ncias
    fc1 = 287; # freq de corte 1
    fc2 = 307; #freq de corte 2
    freq_note = 297; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #fun��o do afinador
  case 3
    # Carregando o arquivo de �udio
    file = 'la.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequ�ncias
    fc1 = 430; # freq de corte 1
    fc2 = 450; #freq de corte 2
    freq_note = 440; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #fun��o do afinador
  case 4
    # Carregando o arquivo de �udio
    file = 'mi.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequ�ncias
    fc1 = 320; # freq de corte 1
    fc2 = 340; #freq de corte 2
    freq_note = 330; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #fun��o do afinador
  case 5
    # Carregando o arquivo de �udio
    file = 'sol.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequ�ncias
    fc1 = 386; # freq de corte 1
    fc2 = 406; #freq de corte 2
    freq_note = 396; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #fun��o do afinador
  case 6
    # Carregando o arquivo de �udio
    file = 'si.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequ�ncias
    fc1 = 485; # freq de corte 1
    fc2 = 505; #freq de corte 2
    freq_note = 495; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #fun��o do afinador
  otherwise
    disp ('Valor fora do range') #else
endswitch
