function sep=separation(idx,data,number_of_clusters)

cols=size(data,2);
mean_data=zeros(number_of_clusters,cols);
cluster_entries=zeros(number_of_clusters,1);
total_mean=zeros(1,cols);

for i=1:size(idx,1)
    mean_data(idx(i,1),:)=mean_data(idx(i,1),:)+data(i,:);
    cluster_entries( idx(i,1))= cluster_entries( idx(i,1))+1;
    total_mean(1,:)=total_mean(1,:)+data(i,:);
end
for i=1:number_of_clusters
    mean_data(i,:)=mean_data(i,:)/cluster_entries(i);
end
 total_mean(1,:)= total_mean(1,:)/size(idx,1);


sep=0;
for  i=1:number_of_clusters
    for j=1:cols
        sep=sep+cluster_entries(i)*((total_mean(1,j)-mean_data(i,j))^2);
    end
end 


end