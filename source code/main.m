clear all; close all; clc;

n = 100;
alpha_min = 4;
alpha_max = 32;

while 1
    A = generate_graph(n);
    
    is_graph_valid = 1;
    for j=1:n
        if sum(A(1:n,j)) == 0
            is_graph_valid = 0;
        end
    end
    
    if is_graph_valid == 1
        break;
    end
end

p = [];
for alpha=alpha_min:alpha_max
    alpha
    min_sum_pts = simulate_and_minimize(A,n,alpha);
    p = [p, min_sum_pts];
end

figure;
plot(alpha_min:alpha_max,p,'LineWidth',2,'Color','blue');
title('Cost function');
xlabel('alpha')
ylabel('p')