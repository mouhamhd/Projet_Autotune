% ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET

clc;
close all;
clear all;



% Pure Filter ananlysis

[sig,fs] = audioread("guitar_2.wav");

plot(fft(sig))


length(sig)
size(sig)
fs