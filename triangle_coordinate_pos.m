clc;clear;


coordinates = importdata('Coordinates.dat'); % extract coordinate matrix


x = input('enter the x coord for a point O to determine if it is inside or outside the triangle: ');
y = input('enter the y coord for a point O to determine if it is inside or outside the triangle: ');


function location  = check(x1, y1, x2, y2, x3, y3, x, y)
% takes input from user and coordinates from dat file to create point and triangle
% evaluates whether point is inside or outside triangle boundaries
% changes text on image based on this
figure
xtri = [x1 x2 x3 x1]; % triangle vertices
ytri = [y1 y2 y3 y1];

mapshow(xtri,ytri,'Color','w') % draw triangle, mapping toolbox

mapshow(x,y,'Marker','.','Color','y','MarkerSize',15) % draw point

text(x1-0.5,y1-0.5,'A','Color','w') % label points
text(x2,y2+0.5,'B','Color','w')
text(x3+0.5,y3,'C','Color','w')
text(x+0.5,y+1,'O','Color','w')

xline = [x 10]; % line connecting point to a point (10,10) in middle of triangle
yline = [y 10];

% check if line connecting dot and middle of triangle intersects/goes through triangle edge
% matrix of intersections
[xi,yi] = polyxpoly(xline,yline,xtri,ytri);

% if there is one or more intersections, we know point is outside as line crossed boundary
intersect = length([xi,yi]);
if intersect > 1
    location = text(10,-1,'the point is outside','Color','w');
else
    location = text(10,-1,'the point is inside','Color','w');
end

axis("off")

end

% vertices
x1 = coordinates(1,1);
y1 = coordinates(1,2);
x2 = coordinates(2,1);
y2 = coordinates(2,2);
x3 = coordinates(3,1);
y3 = coordinates(3,2);

check(x1, y1, x2, y2, x3, y3, x, y) % call function

hold off;