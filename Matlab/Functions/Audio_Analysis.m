% ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET

clc;
close all;
clear all
analyse_audio('/users/elo/myate/Projet_PTS_Israel_Mouhameth/2a_sysnum_dsp_project_autotune/Base_Sound/guitar_1.wav');



function analyse_audio(file)
% Pure Filter ananlysis
size_fft = 1024;
d = 0.1;

[sig,fs] = audioread(file);                 %Recupération du signal
plot(sig);
xlabel("n");
ylabel('amplitude');
title('signal in time domain');
N = length(sig)                            % Nombre d'échantillons du signal
%stem(sig);                %Le signal echantilloné
tf = fftshift(fft(sig));
t = (-fs/2 : fs/(N-1) : (fs/2));
figure;
plot(t,tf);
xlabel("Frequence in herz");
ylabel('linear magnitude of the amplitude');
title('fourier transform of the filter');

time_frequency (sig , fs , size_fft , d);
end

