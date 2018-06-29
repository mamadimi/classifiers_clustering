function [frequency,clusters]=cluster_identification(idx)
max_a=zeros(8,2);
number_of_clusters=max(idx);

a=zeros(number_of_clusters,1);
b=idx(1:24);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /24;
end    

[mx,max_a(1,2)]=max(a);
max_a(1,1)=max_a(1,1)+mx;

b=idx(25:35);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /11;
end    
[mx,max_a(2,2)]=max(a);
max_a(2,1)=max_a(2,1)+mx;

b=idx(36:45);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /10;
end    
[mx,max_a(3,2)]=max(a);
max_a(3,1)=max_a(3,1)+mx;

b=idx(46:55);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /10;
end    
[mc,max_a(4,2)]=max(a);
max_a(4,1)=max_a(4,1)+mx;

b=idx(56:64);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /9;
end    
[mx,max_a(5,2)]=max(a);
max_a(5,1)=max_a(5,1)+mx;

b=idx(65:71);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /7;
end    
[mx,max_a(6,2)]=max(a);
max_a(6,1)=max_a(6,1)+mx;

b=idx(72:75);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /4;
end    
[mx,max_a(7,2)]=max(a);
max_a(7,1)=max_a(7,1)+mx;

b=idx(76:80);
for i=1:number_of_clusters
    a(i)=size(find(b == i),1) /5;
end    
[mx,max_a(8,2)]=max(a);
max_a(8,1)=max_a(8,1)+mx;

frequency=max_a(:,1);
clusters=max_a(:,2);

end