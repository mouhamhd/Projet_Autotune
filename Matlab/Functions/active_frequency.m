 % ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET


function active_frequency(M)    % M is a modulus of a fft

[freq_max, k] = max(M, [] ,'linear'); % extractiong the maximum in each column 
figure;
plot(freq_max);
xlabel('Time in seconde');
ylabel('Frequency in Hz');
title('Active frequence in the the signal');
end