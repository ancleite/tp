clear all
close all
# Criação de uma interface com o usuário
user_menu = menu('Escolha uma nota', 'Dó', 'Ré', 'Lá', 'Mi', 'Sol', 'Si')
# Algoritmo dependendo da escolha do usuário
switch user_menu
  case 1
    # Carregando o arquivo de áudio
    file = 'do.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequências
    fc1 = 257; # freq de corte 1
    fc2 = 277; #freq de corte 2
    freq_note = 267; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #função do afinador
  case 2
    # Carregando o arquivo de áudio
    file = 're.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequências
    fc1 = 287; # freq de corte 1
    fc2 = 307; #freq de corte 2
    freq_note = 297; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #função do afinador
  case 3
    # Carregando o arquivo de áudio
    file = 'la.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequências
    fc1 = 430; # freq de corte 1
    fc2 = 450; #freq de corte 2
    freq_note = 440; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #função do afinador
  case 4
    # Carregando o arquivo de áudio
    file = 'mi.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequências
    fc1 = 320; # freq de corte 1
    fc2 = 340; #freq de corte 2
    freq_note = 330; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #função do afinador
  case 5
    # Carregando o arquivo de áudio
    file = 'sol.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequências
    fc1 = 386; # freq de corte 1
    fc2 = 406; #freq de corte 2
    freq_note = 396; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #função do afinador
  case 6
    # Carregando o arquivo de áudio
    file = 'si.wav';
    info = audioinfo(file);
    [x, fs] = audioread(file);
    # Declarando as frequências
    fc1 = 485; # freq de corte 1
    fc2 = 505; #freq de corte 2
    freq_note = 495; #freq ideal da nota
    [Y] = afinator_function (x, fs, fc1, fc2, freq_note); #função do afinador
  otherwise
    disp ('Valor fora do range') #else
endswitch
