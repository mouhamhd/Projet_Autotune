% ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET

addpath('./Functions/');
addpath('.././Base_Sound/');

size_fft = 1024;
d = 0.01;

file ='/users/elo/myate/Projet_PTS_Israel_Mouhameth/2a_sysnum_dsp_project_autotune/Base_Sound/synth_sweep_1.wav';
[x, fs] = analyse_audio(file);
Modulus = time_frequency(x, fs, size_fft, d);
active_frequency(Modulus);

%time_frequency (sig , fs , size_fft , d);