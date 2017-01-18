%{ 

Variable List:
1. T_data       read data as table
2. x_axis_val   x axis value for plotting
3. UlimX        upper limit of x axis values
4. Vars_val     variable values for plotting
5. Vars_acc     cumsum of variable values

%}
%% // Start;
% clc;clear;close all;
% tic;

%% // Setup


%% // Read;
% T_data = readtable('../_2_Creek_Nm_NC.csv');
% infile_name = ;
T_data = readtable(infile_name);

%% // Extract values
x_axis_val = T_data.(1);
Vars_val = T_data{:,2:end};
Vars_val(isnan(Vars_val)) = 0;

colsum = sum(Vars_val);
Vars_val = bsxfun(@rdivide, Vars_val, colsum);

%% // Cal cumsum
Vars_acc = cumsum(Vars_val);
UlimX = max(x_axis_val);

%% // Plot
%% Choose variable index
for i = 1:size(Vars_val,2)
    Vars_idx = i;

    %% Set Output Figure Size
    f1 = figure;
    set(gcf, 'Units', 'centimeters');
    % set(gcf, 'Position', [0 0 8 6]);

    %% Plot
    [ax,p1,p2] = plotyy(x_axis_val,Vars_val(:,Vars_idx),...
                        x_axis_val,Vars_acc(:,Vars_idx));

    % Add reference line
    hold(ax(2), 'on'); 
    hrl = refline(ax(2),1/UlimX,0);
    hrl.Color = [.1 .1 .1].*7;     % NOTE: Tune the line color
    hold off;   
    
    % Set Limits
    xlim(ax(1),[0 UlimX]);
    xlim(ax(2),[0 UlimX]);  

    % ylim(ax(1),[0 0.1]);
    ylim(ax(1),[0 0.2]);
    ylim(ax(2),[0 1]);  
    
    % Set Ticks
    % set(ax(1),'YTick',[0:0.05:0.1]);
    set(ax(1),'YTick',[0:0.1:0.2]);
    set(ax(2),'YTick',[0:0.2:1]);

    % Refine Figure
    set(ax(1),'box','off','color','w')  % NOTE: Get ax(1) RHS tick off 
    h = plot(ax(2),[0,UlimX],[1,1],'k');  % NOTE: Put top back 
    set(h,'color',[0.1 0.1 0.1].*6);       % NOTE: Tune the line color
    
    % Add Title
    fig_title = cell2mat(T_data.Properties.VariableNames(i+1)); % NOTE: apply cell2mat conversion to convert cell to string
    title(fig_title);
       
    % Set Font Size
    set(gca, 'FontSize', 13);
    ax(2).FontSize =13;

    %% // Output
    % output figures to output folder
    set(f1, 'PaperPositionMode', 'auto');

    % outfolder_name = ;
    print(f1, '-dpng', '-r300', [outfolder_name,'/',fig_title]); 

    close(f1);
end

%% // End;
toc;