load('idx_final.mat')

[frequency,clusters]=cluster_identification(idx)

number_of_clusters = 8;
% Find which numbers are not appeared in the clusters
flag=zeros(8,1);

for i=1:8
    if(find(clusters==i))
        flag(i) = 1;
    end
end

noExistPos = find(flag == 0)

for i=1:length(noExistPos)
    centers=center_of_clusters(idx,new_data,number_of_clusters);
    center = centers(noExistPos(i),:);
    
    %Find the min distance
    min = 1000000000;
    min_pos = 0;
    for j=1:8
        if(j ~= noExistPos(i))
               dis = norm( center - centers(j,:)  );
               if (dis < min)
                min =dis;
                min_pos = j;
               end
        end
    end
    
    min
    min_pos
    idx2=idx;
    for j=1:length(idx)
        if(idx(j) == noExistPos(i))
            idx2(j) = min_pos;
        end
    end
end