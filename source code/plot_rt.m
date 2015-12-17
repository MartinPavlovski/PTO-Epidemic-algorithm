function [ ] = plot_rt( rt, line_width, color )

r = [0];
for i=1:size(rt,2)
    cumulative_sum = 0;
    for j=1:i
        cumulative_sum = cumulative_sum + rt(j);
    end
    r = [r, cumulative_sum];
end

plot(0:size(r,2)-1,r,'LineWidth',line_width,'Color',color);
xlabel('t')
ylabel('rt')

end

