function [ bfs_result ] = bfs( A, source_nodes, M, p, alpha, t, r)

next_nodes = [];
n = size(A,1);
for i=1:size(source_nodes,2)
    %t
    rt = 0;
    for j=1:n
        if A(source_nodes(i),j) == 1
            next_nodes = [next_nodes, j];
            if floor(M(source_nodes(i),j)) < floor(M(source_nodes(i),j) + (1-p(source_nodes(i))))
                rt = rt + 1;
            end
            M(source_nodes(i),j) = M(source_nodes(i),j) + (1-p(source_nodes(i)));
            
            recv_requests = M(1:n,j);
            sum_ones = 0;
            for iter=1:size(recv_requests,1)
                if recv_requests(iter) >= 1
                    sum_ones = sum_ones + floor(recv_requests(iter));
                end
            end
            
            if sum_ones > 1
                p(j) = (sum_ones - 1)/alpha;
            end
        end
    end
    t = t + 1;
    r = [r, rt];
    %M
    %rt
    %p
    
    break_flag = 1;
    for j=1:n
        recv_requests = M(1:n,j);
        request_received = 0;
        for iter=1:size(recv_requests,1)
            if recv_requests(iter) >= 1
                request_received = 1;
                break;
            end
        end
        
        if request_received == 0
            break_flag = 0;
            break;
        end
    end
    
    if break_flag == 1
        break;
    end
end

bfs_result{1} = next_nodes;
bfs_result{2} = M;
bfs_result{3} = p;
bfs_result{4} = t;
bfs_result{5} = r;
bfs_result{6} = break_flag;

end

