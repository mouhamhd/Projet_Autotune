% ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET

clc;
close all;
clear all

%function tf =  analyse_audio("fichier")

% Pure Filter ananlysis

[sig,fs] = audioread("guitar_3.wav");                   %Recupération du signal
plot(sig);
N = length(sig);                            % Nombre d'échantillons du signal
%stem(sig);                %Le signal echantilloné
tf = fftshift(fft(sig));
t = (0:fs/N:(N-1));
figure;
plot(tf);
xlabel("Frequence in herz");
ylabel('linear magnitude of the amplitude');
title('fourier transform of the filter');



