% ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET
clear all; 
close all; 
clc;
addpath('./Functions/');
addpath('.././Base_Sound/');
size_fft = 1024;
d = 0.01;

file = '/users/elo/bkafando/Bureau/Projet_PTS/mouhameth_israel_projet_pts/Base_Sound/synth_sweep_1.wav';
[x, fs] = analyse_audio(file);
Modulus = time_frequency(x, fs, size_fft, d);
active_frequency(Modulus);
% a = 12/pi - 9/4;
% b = -2*a + 5/2;
% c = a - 3/2;
% 
% e = -0.99:0.01:0.99;
% y = zeros(1, length(e));
% y_p = y;
% for i = 1:length(e)
%     x(i)= lshift(e(i), 15);
%  y(i) = fixSine(x(i));
% end
% for i = 1:length(e)
%  y_p(i) = a*e(i) + b*(e(i))^3 + c*(e(i))^5;
% end
% % 
% % 
% % figure(1); hold on;
% plot(e, y/(max(abs(y))));%fixpoint
% figure(1); hold on;
% plot(e, sin((pi/2)*e)); %real sinus
% figure(1); hold on;
% plot(e ,y_p);
% legend();
% legend('FixSine','sineReal' ,'Taylor');
% xlabel("");
% ylabel('amplitude');
% title('Comparaison sinus');

x = reconstruct_signal(fs);
time_frequency (x , fs , size_fft , d);
ylabel("Frequence in herz");
xlabel('time [s]');
title('first after reconstruction');