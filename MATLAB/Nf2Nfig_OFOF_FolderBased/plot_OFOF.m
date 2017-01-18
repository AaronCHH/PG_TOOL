%% # START
% clc;clear;close all; %<= REMEMBER TO OMIT FOR BATCHING =>

%% =====================================
%% # Read Data
%% =====================================

% < One file test ------------------
% data = readtable('Run.csv');
% One file test  ------------------- >
% data = readtable(infile_name);   % # < for running Nf2Nfig_filebased > %<= GET INPUF FILE NAME FROM BATCH =>
data = readtable(infile_fullpath); % # < for running Nf2Nfig_folderbased > %<= GET INPUF FILE NAME FROM BATCH =>


%% =======================================
%% # PLOT
%% =======================================

%% # Plot Setting
% <=== Set Output Figure Size ======
f1 = figure;
set(gcf, 'Units', 'centimeters');
% set(gcf, 'Position', [0 0 15 10]);      % MOD
% ==============================>


%% # Plot
%< ===================================
h = plot(data.RowLabels, data.SR, ...
         data.RowLabels, data.NR, ...
         data.RowLabels, data.XDR);
% ====================================>
		 
ax = gca;

%% ======================================
%% # Plot Control
%% ======================================
% # Specify Line Width
h(1).LineWidth = 2;
h(2).LineWidth = 2;
h(3).LineWidth = 2;

% % # Adjust Axes
% % ax.Box = 'off';  % # Turn off original axes box
% % ax.Color = 'none';
% % b = axes('Position',get(ax,'Position'),'box','on','xtick',[],'ytick',[]);  % # Create new axes
% % b.LineWidth = 2;
% % axes(ax);  % # Active original axes

ax.FontSize = 16;
ax.LineWidth = 2;

%% # Reference Line (optional)


%% # Set Limit
ax.YLim = [0 800];
ax.XLim = [0 1200];

%% # Set Tick
ax.YTick = [0:200:800];
ax.XTick = [0:200:1200];

ax.TickDir = 'out';

%% # Refine Figure


%% # Add Title
% < One file test -------------
% fig_title = 'Title';
% One file test --------------- >
title(fig_title);

%% # Adjust axes
ax.Box = 'off';  % # Turn off original axes box
axes(ax);  % # Active original axes

%% ## Put box back
hold on;
ht = plot(ax,[0,1200],[800,800],'k');  % NOTE: Put top back 
set(ht,'color',[0.1 0.1 0.1].*0);       % NOTE: Tune the line color
ht.LineWidth = 2;

hr = plot(ax,[1200,1200],[0,800],'k');  % NOTE: Put top back 
set(hr,'color',[0.1 0.1 0.1].*0);       % NOTE: Tune the line color
hr.LineWidth = 2;

%% # Add Labels
xlabel('Distance from Upstream (m)');
ylabel('MU Area(m^2)');

%% # Add Legend
hl = legend('Nanshi','Beishi','Xindian');
hl.Box = 'off';

%% # Set Font Size

%% =================================================
%% # Output
%% =================================================
% # Set output file setting (WYCIWYG)
set(f1, 'PaperPositionMode', 'auto');

% < One file test ?? ----------------
% outfdr_name = 'outfdr';
% mkdir(outfdr_name);
% One file test ------------------- >

% print(f1, '-dpng', '-r500', [fig_title]); % # < for running OFOF_filebased >
print(f1, '-dpng', '-r500', [outfdr_name,'/',fig_title]); % # < for running OFOF_folderbased >

close(f1);

