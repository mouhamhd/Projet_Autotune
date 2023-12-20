% ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET

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

a = 12/pi - 9/4;
b = -2*a  + 5/2;
c = a - 3/2;


x = -1.5:0.01:1.5;
y = zeros(1, length(x));
y_p = y;
for i = 1:length(x)
    y(i) = fixSine(x(i));
end

for i = 1:length(x)
    y_p(i) = a*x(i) + b*(x(i))^3 + c*(x(i))^5;
end

figure(1); hold on;
plot(x, y/(max(abs(y))));
figure(1); hold on;
plot(x, sin((pi/2)*x));
figure(1); hold on;
plot(x, y_p);
legend('sine','y[p]');
legend('FixSine','sine','y[p]');

%time_frequency (sig , fs , size_fft , d);