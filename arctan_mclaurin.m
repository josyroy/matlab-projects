clc;
clear;

% initialize vector to store solutions and error values
A = [];
B = [];
% desired x and n values to calculate with
x_value = [0.5,1];
n_value = [1,2,4,6,10];

% loop for sum of a series
for i = x_value
    for j = n_value
        arctan = 0;
        for x = i
            for n = 0:j
                formula = ((-1)^n) * (x^(2*n + 1)) / (2*n + 1);
                arctan = arctan + formula;
            end
        end
        sol = vpa(arctan);
        A = [A;sol];
        error = vpa((sqrt((sol - atan(x))^2)/atan(x))*100,10);
        B = [B;error];
    end
end

% split arrays into computations for the two separate x values
x_equals_point_5 = A(1:5)
x_equals_1 = A(6:10)
x_equals_point_5_error = B(1:5)
x_equals_1_error = B(6:10)

% make the graph with both x values, error for x=0.5, x=1 vs n
figure
plot([1,2,4,6,10],x_equals_point_5_error,[1,2,4,6,10],x_equals_1_error)

% tabular format
n_values = [1;2;4;6;10];
disp("true vs. estimated percent relative errors for different x and n values")
errors = table(n_values,x_equals_point_5_error,x_equals_1_error)