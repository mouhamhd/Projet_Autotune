% ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhameth
% 
% Enseignant : Robin GERZAGUET



function [sig,fs] = analyse_audio(file)
% Pure Filter ananlysis


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

%time_frequency (sig , fs , size_fft , d);

end

