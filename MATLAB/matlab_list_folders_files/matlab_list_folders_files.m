%% 
clc;clear;
tic;

%% 
%% Get item list
d = dir(pwd);

%% Get folder names  
isub = [d(:).isdir]; %# returns logical vector
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];

%% Get file names  
jsub = ~[d(:).isdir]; %# returns logical vector
nameFiles = {d(jsub).name}';

%% Combine lists
iList = table([nameFolds; nameFiles]);

%% Save results
writetable(iList,'List.csv','Delimiter',',')

%% 
toc