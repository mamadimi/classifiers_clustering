function SSE=mysse(idx,data,number_of_clusters)
cols=size(data,2);
rows=size(data,1);
mean_data=zeros(number_of_clusters,cols);
cluster_entries=zeros(number_of_clusters,1);
for i=1:size(idx,1)
    mean_data(idx(i,1),:)=mean_data(idx(i,1),:)+data(i,:);
    cluster_entries( idx(i,1))= cluster_entries( idx(i,1))+1;
end
for i=1:number_of_clusters
    mean_data(i,:)=mean_data(i,:)/cluster_entries(i);
end

SSE=0;
for i=1:rows
        SSE=SSE+(norm(data(i,:)-mean_data(idx(i,1),:))^2);
end
