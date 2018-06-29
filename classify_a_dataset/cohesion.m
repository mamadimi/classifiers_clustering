function coh=cohesion(idx,data,number_of_clusters)
cols=size(data,2);
mean_data=zeros(number_of_clusters,cols);
cluster_entries=zeros(number_of_clusters,1);

for i=1:size(idx,1)
    mean_data(idx(i,1),:)=mean_data(idx(i,1),:)+data(i,:);
    cluster_entries( idx(i,1))= cluster_entries( idx(i,1))+1;
end
for i=1:number_of_clusters
    mean_data(i,:)=mean_data(i,:)/cluster_entries(i);
end


coh=0;
for  i=1:size(idx,1)
    for j=1:cols
        coh=coh+(data(i,j)-mean_data(idx(i,1),j))^2;
    end
end 


end