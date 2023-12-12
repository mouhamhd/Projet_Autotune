 % ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET

clc;
close all;
clear all


time_frequency('/users/elo/myate/Projet_PTS_Israel_Mouhameth/2a_sysnum_dsp_project_autotune/Base_Sound/synth_sweep_1.wav');
function time_frequency (file)   

% funtion parameters
% 
% x : The input signal
% 
% fs : The sampling frequency
% 
% size_fft : An integer at a power of 2 that gives the size of the fft.
% 
% d : duration in which the signal is chunked

[x , fs] = audioread(file);                 %Recupération du signal
 d = 0.1;
 size_fft = 2048;

Ts =  1/fs;                   %Sampling time
p = floor(d/Ts);             %Number of elements in every piece
k = floor(length(x)/p);      %Number of pieces to which the input is chunked
t = "*********************************************"
x
t = "*********************************************"
nb_taille = p*k             % The number of elemnts that will considered for the fft calculation
x_int = x(1:nb_taille);     % Take elements in a fitting size if p*k is different than the input length
nbzeros = size_fft - p;      %Number of rzeros to add for zero padding

length(x);

Mat1 = zeros(p, k);          %Initialization of matrizes to stocks the results

Mat_zero = zeros(size_fft -p, k);          %Initialization of matrizes to stocks the results

M_fft = zeros(size_fft, k);
M_mod = zeros(size_fft, k);
M_arg = zeros(size_fft, k);

%Creating the matrice taht contains 
m = "*********************************************"
Mat1 = reshape(x_int, [p, k]); %.*hanning(p);
Mat2 = [Mat1 ; Mat_zero];

M_fft = (fft(Mat2));   %Performing the fft with zero padding
M_mod = abs(M_fft);            %Get the module of the result
M_arg = angle(M_fft);          %Get the phase

%Display of the result
set(gca, 'YDir', 'normal');
imagesc(M_mod);



end



