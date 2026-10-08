clc;clear;

% eqns
one = @(x,y) (x^2+3*y)*exp(-x^2-y^2);
two = @(x,y) -3*y/(x^2+y^2+1);
three = @(x,y) abs(x) + abs(y);

% allow user to choose function
choice = menu('pick one equation to work with','(x^2+3*y)*exp(-x^2-y^2), -3<=x<=3, -3<=y<=3', ...
    '-3*y/(x^2+y^2+1), abs(x)<=2, abs(y)<=4','abs(x)+abs(y), abs(x)<=1, abs(y)<=1');

bool = 1; % True

while bool

    x = input('choose an x value ');
    y = input('choose a y value ');

    % equation and bounds must be met, otherwise ask for input again
    if choice == 1 && x>=-3 && x<=3 && y>=-3 && y<=3
        one(x,y)
        fprintf('the value for the first eq is %d\n',one(x,y)); % plug input into equation
        bool = 0;
    elseif choice == 2 && abs(x)<=2 && abs(y)<=4
        two(x,y)
        fprintf('the value for the second eq is %d\n',two(x,y));
        bool = 0;
    elseif choice == 3 && abs(x)<=1 && abs(y)<=1
        three(x,y)
        fprintf('the value for the third eq is %d\n',three(x,y));
        bool = 0;
    else
        disp('selection is not in bounds, try again')
        continue
    end
end