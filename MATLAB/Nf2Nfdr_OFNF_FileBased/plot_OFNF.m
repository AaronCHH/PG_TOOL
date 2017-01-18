%% ===================================
%%  # START
%% ===================================

% clc;clear;close all;    % <= Remember to close =>

%% ===================================
%% # READ DATA
%% ===================================

% <= One file test ==================
% data = readtable('L.csv');
% One file test ====================> 
data = readtable(infile_name);   %# < for running OFNF_filebased > 
                                 %# <= GET INPUT FILE NAME FORM BATCH =>

%% # UPDATE DATA (Normalized)
data2 = data;
data2{:,2:end-1} = bsxfun(@rdivide, data2{:,2:end-1}, data2.MaxOfWidth_eq);
data2{:,2:end-1} = data2{:,2:end-1} .* 33;

%% # CALC AVERAGE
Vars_avg = nanmean(data2{:,2:end-1});

%% =========================================
%% # PLOT (VARS FROM SINGLE FILE/ VARIABLES)
%% =========================================

for i = 1:size(data2{:,2:end-1},2)
    
    Vars_idx = i;
    
    %% # Set Output Figure Size
    f1 = figure;
    set(gcf, 'Units', 'centimeters');
    % set(gcf, 'Position', [0 0 8 6]);
    
    %% # Plot
%     h = plot(x_axis_val, Vars_val(:,Vars_idx));
    h = plot(data2.RowLabels, data2{:,Vars_idx + 1});
    ax = gca;

    % # Add avg line
    hold on;

    havg = plot(ax,[0, 1200],[Vars_avg(i), Vars_avg(i)],'--k');  % NOTE: Put top back     
    havg.LineWidth = 1.5;

    hold off;
    
    % # Set Limits
    xlim(ax, [0 1200]);
    myYlim = 5; 
    ylim(ax, [0 myYlim]);      
    
    ax.TickDir = 'out';
    ax.LineWidth = 2;    

    % Refine Figure
    hold on;
    % set(ax(1),'box','off','color','w')  % NOTE: Get ax(1) RHS tick off 
    set(ax,'box','off','color','w')  % NOTE: Get ax RHS tick off 
    % h = plot(ax(2),[0,1200],[1,1],'k');  % NOTE: Put top back 
    htop = plot(ax,[0, 1200],[myYlim, myYlim],'k');  % NOTE: Put top back     
    hright = plot(ax,[1200, 1200],[0, myYlim],'k');  % NOTE: Put top back 
    htop.LineWidth = 2;
    hright.LineWidth = 2;
    
    % # Tune the line color
    set(h,'color',[0.1 0.1 0.1].*0);       % NOTE: Tune the line color
    % - 
    h.LineWidth = 2;

    hold off;

    % # Add Title
    fig_title = cell2mat(data2.Properties.VariableNames(i+1)); % NOTE: apply cell2mat conversion to convert cell to string
    title(fig_title);

    % # Add ylabel
    ylabel('No. of MU Blocks');
    xlabel('Distance from Upstream (m)');

    % # Add legend
    hleg = legend('Width Normalized','Average');   
    legend('boxoff');     
    hleg.FontSize = 16;
       
    % # Set Font Size
    set(gca, 'FontSize', 16);
    % ax(2).FontSize = 16;
    ax.FontSize = 16;

    %% // Output
    % output figures to output folder
    set(f1, 'PaperPositionMode', 'auto');
    

    %%  < FOR ONE FILE TEST ============================
    % outfolder_name = 'out_test';
    % mkdir(outfolder_name);
    %%  =============================================== >
    print(f1, '-dpng', '-r500', [outfolder_name,'/',fig_title]); 

    close(f1);    
    
end
