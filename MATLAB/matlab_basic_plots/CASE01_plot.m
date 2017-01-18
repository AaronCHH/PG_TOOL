%% // Start;
clc;clear;close all;
tic;

%% <=== Setting =====================
infile_name = 'Riffle.csv';
outfolder_name = 'outfdr';  %# set '' if no outfdr
fig_title = 'foo';
% ==================================>

%% // Read;
DT = readtable(infile_name);
DT = DT(1:end-1,:);

%% // plot
DT_val = DT.CountOfShape_Area;
DT_lab = DT.RowLabels;

%% <=== Set Output Figure Size ======
f1 = figure;
set(gcf, 'Units', 'centimeters');
set(gcf, 'Position', [0 0 30 6]);      % MOD
%% ==============================>

bar(DT_val);

%% <==============================
%% Add Label
set(gca, 'XTicklabel',DT_lab)
%% Add Title
% fig_title = mu_name;
title(fig_title);
%% Set Font Size
% set(gca, 'FontSize', 13);

%% Output plot    
% create output folder
mkdir(outfolder_name);
%% 

% output figures to output folder
set(f1, 'PaperPositionMode', 'auto');
print(f1, '-dpng', '-r300', [outfolder_name,'/',fig_title]);  %# Use w/ outfdr
% print(f1, '-dpng', '-r300', [fig_title]); %# Use w/o outfdr
close(f1);  
%% ==============================>


%% // End;
toc;

