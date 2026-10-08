clc;clear;

bool = 0;

while bool == 0
    disp('e = (1-1/n)^n')
    n = input('choose the n value\n');
    allowance = input('choose the difference allowed\n');

n_required = 0; % initialize

for i = 1:n % loop to find accurate 1/e value
    approx = (1-1/i)^i;
    diff = exp(-1) - approx;
    if diff < allowance % break and return n and 1/e if cond met
        n_required = i;
        inverse_e = approx;
        actual = exp(-1);
        fprintf(['the real value for e^-1 is %f, the calculated value is %f, ' ...
            'and the n required for this accuracy is %f'], ...
            actual, inverse_e, n_required)
        bool = 1;
        break
    end
end
if diff > allowance
    disp('your n value is too low, or your difference required is too small')
end
end
