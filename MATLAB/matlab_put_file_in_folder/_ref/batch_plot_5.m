%% // Start;
clc;clear;close all;
tic;

%% // Read;
%% Get file list and # of files
file_list = dir(fullfile('*.csv')); % search files
file_n = size(file_list,1);         % cal # of files

for j = 1:file_n      
    
    % loop through file names on the list
    infile_name = file_list(j).name;
    disp(['Processing file: ',infile_name]);
    
    % loop create outfolder name; create output folder in plot_5
    [pathstr,name,ext] = fileparts(file_list(j).name); 
    outfolder_name = ['out_',name]; 
    
    % Call subroutine 
    plot_5;                         
    
    % clear workspace
    clear -j;                      
end


%% // End;
toc;

