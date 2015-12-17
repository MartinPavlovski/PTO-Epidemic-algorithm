function [ result ] = propagate_request( A, initial_node, alpha )

n = size(A,1);
source_nodes = initial_node;
M = zeros(n);
t = 0;
p = zeros(1,n);
r = [];
while 1
    bfs_result = bfs(A,source_nodes,M,p,alpha,t,r);
    source_nodes = bfs_result{1};
    M = bfs_result{2};
    p = bfs_result{3};
    t = bfs_result{4};
    r = bfs_result{5};
    break_flag = bfs_result{6};
    
    if break_flag == 1
        break;
    end
end

result{1} = t;
result{2} = p;
result{3} = r;

end

