function [ A ] = generate_graph( n )

A = zeros(n);
for i=1:n
    for j=1:n
        if i ~= j
            A(i,j) = rand_int(0,1,1);
        end
    end
end

end

