%{
	make copys of filename1;
	rename files' name beginning with filename2	
%}

%% // Start;
clc;clear;close all;
tic;

%% // Copy template file and generate new files
filename1 = 'Matlab.m';
filename2 = 'EXE';
N = 3;
for i = 1:N;
    if i < 10
        copyfile(filename1,[filename2, num2str(0), num2str(i),'.m']);
    else
        copyfile(filename1,[filename2, num2str(i), '.m']);
    end    
end

%% // End;
toc;