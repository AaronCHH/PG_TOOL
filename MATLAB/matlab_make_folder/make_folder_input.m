%% // Start;
clc;clear;close all;
tic;

%% // Read;
% fdrnm = 'Ch';
% N = 17;

folderName = input('foldername:', 's')
N = input('Number of folders:')

for i = 1:N;
    if i < 10
        mkdir([folderName,num2str(0), num2str(i)]);
    else
        mkdir([folderName, num2str(i)]);        
    end
end

%% // End;
toc;