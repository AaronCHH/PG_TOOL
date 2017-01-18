%% // Start;
clc;clear;close all;
tic;

%% // Read;
fdrnm = 'App';
N = 10;
for i = 1:N;
  mkdir([fdrnm,char('A' + i - 1)]);
end

%% // End;
toc;