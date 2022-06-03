% --- UART Test 
% This script aims to create a communication channel between the Zybo board
% and the remote Matlab session on a PC. The purpose is to gather some data
% from the Zybo internal memory that can be interpreted in Matlab for
% debugging purpose.

clearvars all 
close all
clc

% --- Define Port where Zybo is plugged 
% You can use serialportlist to have a list of connected device. You should
% also have a look on > dmesg | tail in a terminal to see the activity
% after you have plugged the Zybo board 
portName = "/dev/ttyUSB1";
% --- Open the socket 
s = serialport(portName,115200,"Timeout",1000);

CONTINUE = true; 
allC = {};
disp('Wait for new content');
while CONTINUE 
    % --- get a new content from the Zybo board 
    content = readline(s);
    disp(content);
    % --- Push all result in the current dictionnary
    allC{end+1} = content;
    % --- Evaluate the content directly in the Matlab scope     
    if contains(content,'End of Simulation')
        CONTINUE = false;
    end
end
delete(s)

% --- Now to load the content in Matlab session
% -> You can inspect the print 
% If you have used print_array_float you can 
% res = loadArray_float(allC,idx) 
% If you have used print_array_u32 use
% res = loadArray_u32(allC,idx) 
% with idx the index where your array is defined 