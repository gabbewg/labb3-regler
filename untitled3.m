a = 0;
x = 0.11;
g = @(t) 2/sqrt(pi)*exp(-t^2);
exact_integral = erf(x);  % Exact integral value

% Define the range of N values
Nv = 10:1000; 

% Pre-allocate an array for errors
errors = zeros(size(Nv)); 

% Loop over different values of N
for i = 1:length(Nv)
    N1 = Nv(i);
    
    % Compute the approximation using the trapezoidal rule
    appr = trapetz(g, a, x, N1);
    
    % Compute the absolute error
    errors(i) = abs(exact_integral - appr);
end

% Plot the error as a function of N using log-log scale
figure;
loglog(Nv, errors, '-o');
xlabel('N (number of subintervals)');
ylabel('Error');
title('Error of Composite Trapezoidal Rule');
grid on;

% Trapezoidal rule implementation
function I = trapetz(g, a, x, N)
    h = (x - a) / N;
    
    sum = 0;
    sum = sum + g(a) + g(x);
    
    for i = 1:N-1
        sum = sum + 2 * g(a + i * h);
    end
    
    I = (h / 2) * sum;
end
