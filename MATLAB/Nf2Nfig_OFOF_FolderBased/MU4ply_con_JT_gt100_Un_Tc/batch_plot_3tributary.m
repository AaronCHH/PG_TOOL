%% // Start;
clc;clear;close all;
tic;

%% // Read;
% # Get infile list and # of infiles
% # Set infolder_name(optional) and outfolder_name
% infolder_name = ;
% outfolder_name = 'outfdr';    

file_list = dir(fullfile('*.csv')); % search files
file_n = size(file_list,1);         % calc # of files

%% // Batch Process infiles
for j = 1:file_n      
    
    % loop through file names on the list
    infile_name = file_list(j).name;  
        
    fig_title = strrep(infile_name,'.csv','' );
        
    % loop create outfolder name; create output folder in plot_5
    [pathstr,name,ext] = fileparts(file_list(j).name); 

    % Call subroutine 
    plot1;                       
    
    % Clear Workspace
    clear -j;                      
end


%% // End;
toc;

