%% // Start;
clc;clear;close all;
tic;

%% // Read;

%# < ADD FOR LOOPING FOLDERS =======

% # Get infdr list and # of infdr
d = dir(pwd);
isub = [d(:).isdir]; %# returns logical vector
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];

%# ADD FOR LOOPING FOLDERS > =======

%% // Loop through all input file folders
for i = 1:length(nameFolds) %# < ADD FOR LOOPING FOLDERS =======

    % # Get infile list and # of infiles
%     file_list = dir(fullfile('*.csv')); % search files    % # < for running Nf2Nfig_filebased >
%     file_n = size(file_list,1);         % calc # of files % # < for running Nf2Nfig_filebased >
    
    %# < ADD FOR LOOPING FOLDERS =======    
    infolder_path = [cell2mat(nameFolds(i)),'/'];
    file_list = dir([infolder_path,'*.csv']); % search files; complete path name
    file_n = size(file_list,1);         % cal # of files    
    % Loop creating output folder
    outfdr_name = ['out_',cell2mat(nameFolds(i))];  % **** SPECIFY
    mkdir(outfdr_name);    
    
    %# ADD FOR LOOPING FOLDERS > =======

    %% // Batch Process infiles
    for j = 1:file_n      

        %%         
        % loop through file names on the list        
        infile_name = file_list(j).name;  
        infile_fullpath = [infolder_path,file_list(j).name]; % *** complete path name        

        fig_title = strrep(infile_name,'.csv','' );
       
        %% 
        % loop create outfolder name; create output folder in plot_5
% %         [pathstr,name,ext] = fileparts(file_list(j).name); 
        [pathstr,name,ext] = fileparts(infile_fullpath); 

        % # Call subroutine 
        plot_OFOF;                       

        % Clear Workspace
        clear -j;                      
    end
    clear i;
end

%% // End;
toc;

