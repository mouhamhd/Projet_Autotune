 % ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET

clc;
close all;
clear all



function time_frequency (x , fs , size_fft , d)   

% funtion parameters
% 
% x : The input signal
% 
% fs : The sampling frequency
% 
% size_fft : An integer at a power of 2 that gives the size of the fft.
% 
% d : duration in which the signal is chunked

Ts =  1/fs;                   %Sampling time
p = floor(d/Ts);             %Number of elements in every piece
k = floor(length(X)/p);      %Number of pieces to which the input is chunked
nb_taille = p*k;             % The number of elemnts that will considered for the fft calculation
x_int = x(1:nb_taille);      % Take elements in a fitting size if p*k is different than the input length
nbzeros = size_fft - p;      %Number of rzeros to add for zero padding

Mat1 = zeros(p, k);          %Initialization of matrizes to stocks the results
M_fft = zeros(size_fft, k);
M_mod = zeros(size_fft, k);
M_arg = zeros(size_fft, k);

%Creating the matrice taht contains 
Mat1 = reshape(x_int, [p, k]).*hamming(p);

M_fft = fft(Mat1, size_fft);   %Performing the fft with zero padding
M_mod = abs(M_fft);            %Get the module of the result
M_arg = angle(M_fft);          %Get the phase

%Display of the result
set(gca, 'YDir', 'normal');
imagesc(M_mod);

end



