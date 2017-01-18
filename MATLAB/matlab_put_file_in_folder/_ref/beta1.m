%% // Start;
clc;clear;close all;
tic;

%% // Read;
%% // Get file list and # of files
file_list = dir(fullfile('*.pdf')); % search files
file_n = size(file_list,1);         % cal # of files

for j = 1:file_n      
    
    % loop through file names on the list
    infile_name = file_list(j).name;
    disp(['Processing file: ',infile_name]);
    
    % loop create outfolder name
    [pathstr,name,ext] = fileparts(file_list(j).name); 
    outfolder_name = name; 

    % make folder
    mkdir(outfolder_name);
    
    % move files
    movefile(infile_name,outfolder_name)
                           
end


%% // End;
toc;

