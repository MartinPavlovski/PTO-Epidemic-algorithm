function [ min_sum_pts ] = simulate_and_minimize( A, n, alpha )

t = [];
p = [];
r = [];
min_ts = n^n;
min_sum_pts = n;
min_sum_rt = n^n;
all_rt = [];
all_rt_sums = [];
best_ts_initial_node = 1;
best_sum_pts_initial_node = 1;
best_sum_rt_initial_node = 1;

for i=1:n
    result = propagate_request(A,i,alpha);
    ts = result{1};
    sum_pts = sum(result{2});
    rt = result{3};
    sum_rt = sum(rt);
    
    all_rt{i} = rt;
    all_rt_sums = [all_rt_sums, sum_rt];
    
    if ts < min_ts
        min_ts = ts;
        best_ts_initial_node = i;
    end
    t = [t, ts];
  
    if sum_pts < min_sum_pts
        min_sum_pts = sum_pts;
        best_sum_pts_initial_node = i;
    end
    p = [p, sum_pts];
    
    if sum_rt < min_sum_rt
        min_sum_rt = sum_rt;
        best_sum_rt_initial_node = i;
    end
    r = [r, sum_rt];
end

figure;
all_rt_sums = sort(all_rt_sums);
middle = round(size(all_rt_sums,2)/2);
for i=1:n
    if sum(all_rt{i}) ~= all_rt_sums(1)
        if sum(all_rt{i}) ~= all_rt_sums(middle)
            if sum(all_rt{i}) ~= all_rt_sums(size(all_rt_sums,2))
                plot_rt(all_rt{i},1,'blue');
                hold on;
            end
        end
    end
end
for i=1:n
    if sum(all_rt{i}) == all_rt_sums(size(all_rt_sums,2))
        plot_rt(all_rt{i},2,'red');
        hold on;
    end
end
for i=1:n
    if sum(all_rt{i}) == all_rt_sums(middle)
        plot_rt(all_rt{i},2,'yellow');
        hold on;
    end
end
for i=1:n
    if sum(all_rt{i}) == all_rt_sums(1)
        plot_rt(all_rt{i},2,'green');
        hold on;
    end
end

%figure;
%plot(1:n,t,'LineWidth',2,'Color','blue');
xlabel('index na inicijalen jazel i')
ylabel('vreme potrebno za propagacija niz celata mreza ts')
min_ts
best_ts_initial_node

%figure;
%plot(1:n,p,'LineWidth',2,'Color','red');
xlabel('index na inicijalen jazel i')
ylabel('vkupna verojatnost za otstranetost na jazlite sum(pi(ts))')
min_sum_pts
best_sum_pts_initial_node

%figure;
%plot(1:n,r,'LineWidth',2,'Color','green');
xlabel('index na inicijalen jazel i')
ylabel('broj na jazli koi ja primile porakata rt')
min_sum_rt
best_sum_rt_initial_node

end

