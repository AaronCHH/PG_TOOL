%% // Start;
clc;clear;close all;
tic;

%% // Get input file folder list
%d = dir(pathFolder);
d = dir(pwd);
isub = [d(:).isdir]; %# returns logical vector
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];


%% // Create tmp folder
new_fdr_set = 'cpy_fdr_set';
mkdir(new_fdr_set);

%% // Loop through all input file folders
for j = 1:length(nameFolds)
    
    disp(nameFolds(j));
    mkdir([new_fdr_set,'/',cell2mat(nameFolds(j))]);
             
end

%% // End;
toc;
