function [ rand_num ] = rand_int( a, b, num_rands )

    rand_num = round((b-a).*rand(num_rands,1) + a);
    
end

