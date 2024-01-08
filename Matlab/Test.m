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
% 
% size_fft = 1024;
% d = 0.01;
% 
% file ='/users/elo/bkafando/Bureau/Projet_PTS/mouhameth_israel_projet_pts/Base_Sound/synth_sweep_1.wav';
% [x, fs] = analyse_audio(file);
% Modulus = time_frequency(x, fs, size_fft, d);
% active_frequency(Modulus);



%**********************************************%

% a = 12/pi - 9/4;
% b = -2*a  + 5/2;
% c = a - 3/2;


% x = linspace(-pi,pi,2000);
% X = x.* 2/pi;
%e = X .* 2^14;

% e = -1.99:0.01:1.99;
% y = zeros(1, length(e));
% y_p = y;
% for i = 1:length(e)
%     x(i) = lshift(e(i), 14);
%     y(i) = sinfpv2(x(i));
% end


 

% for i = 1:length(e)
%     y_p(i) = a*e(i) + b*(e(i))^3 + c*(e(i))^5;
% end


% figure(1); hold on;
% plot(e, y/(max(abs(y))));
% figure(1); hold on;
% plot(e, sin((pi/2)*e));
% figure(1); hold on;
% legend();
% legend('FixSine','sine');

%time_frequency (sig , fs , size_fft , d)

Fc = 20;
Fc = lshift(Fc , 3);
Fs = 8000;
Fs = lshift(Fs , 2);
x = generate_wave(Fc, Fs );
length(x)
plot(x)
