figure % new figure

data = importdata('Data.dat'); % extract data matrix

x = data(1,:); % years on x axis
bh = bar(x, data(2:6,:), 0.4, 'stacked'); % stacked bar graph

set(bh, 'FaceColor', 'flat')
bh(1).CData = [0 0 1];  % Change colors
bh(2).CData = [0 1 0];
bh(3).CData = [1 0 0];
bh(4).CData = [0 1 1];
bh(5).CData = [1 1 0];

hold on;

colororder({'w','w'}) % both y axis colors
yyaxis left
ylabel('Electricity generated (TWh)')

y = data(7,:); % last row as line plot
yyaxis right
plot(x,y, 'Color', 'm')
ylabel('(% of consumption)','Color','w','Rotation',-90)
ylim([0,30])
ax = gca;
ax.YTick = 0:3:30; % y axis goes up by 3 every tick

ax.YGrid = "on"; % horizontal lines
set(ax, 'Box', 'off') % hide graph outline

legend boxoff;
legend('Geothermal (TWh)', 'Biomass & renewable waste (TWh)', 'Solar (TWh)', ...
    'Wind turbines (TWh)', 'Hydropower (TWh)', ['Electricity from renewables' ...
    ' (% of consumption)'], 'Location','eastoutside');
hold off;