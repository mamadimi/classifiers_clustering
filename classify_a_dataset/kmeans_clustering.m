%% Kmeans Clustering 
clear
clc
close all

%Init data
run('choose_data.m');


%% Distance = sqeuclidean
number_of_iterations=5;
sse_euclidean=0;
cohesion_euclidean=0;
separation_euclidean=0;

freq_euclidean=zeros(8,1);
for k=1:number_of_iterations   
    
    [idx,c,sse,d] = kmeans(new_data,8,'distance','sqeuclidean','EmptyAction','singleton');
    
    sse_euclidean=sse_euclidean+sum(sse);
    cohesion_euclidean=cohesion_euclidean+cohesion(idx,new_data,8);
    separation_euclidean=separation_euclidean+separation(idx,new_data,8);
    [frequency_euclidean,clusters_euclidean]=cluster_identification(idx);
    freq_euclidean=freq_euclidean+frequency_euclidean;
end

freq_euclidean=freq_euclidean/number_of_iterations;
sse_euclidean=sse_euclidean/number_of_iterations;
cohesion_euclidean=cohesion_euclidean/number_of_iterations;
separation_euclidean=separation_euclidean/number_of_iterations;

 silhouette(new_data,idx,'euclidean')
 sse_euclidean
 cohesion_euclidean
 separation_euclidean
 
 
%% Distance = Cityblock
number_of_iterations=10;
sse_cityblock=0;
cohesion_cityblock=0;
separation_cityblock=0;

freq_cityblock=zeros(8,1);
for k=1:number_of_iterations
    
    [idx,c,sse] = kmeans(new_data,8,'distance','cityblock','EmptyAction','singleton');
    
    sse_cityblock=sse_cityblock+sum(sse);
    cohesion_cityblock=cohesion_cityblock+cohesion(idx,new_data,8);
    separation_cityblock=separation_cityblock+separation(idx,new_data,8);
    [frequency_cityblock,clusters_cityblock]=cluster_identification(idx);
    freq_cityblock=freq_cityblock+frequency_cityblock;
end

freq_cityblock=freq_cityblock/number_of_iterations;
sse_cityblock=sse_cityblock/number_of_iterations;
cohesion_cityblock=cohesion_cityblock/number_of_iterations;
separation_cityblock=separation_cityblock/number_of_iterations;

figure();
 silhouette(new_data,idx,'cityblock')
 sse_cityblock
 cohesion_cityblock
 separation_cityblock
 


%% Distance = Correlation
number_of_iterations=10;
sse_correlation=0;
cohesion_correlation=0;
separation_correlation=0;

freq_correlation=zeros(8,1);
num_of_clusters = 8;
for k=1:number_of_iterations   
    
    [idx,c,sse] = kmeans(new_data,num_of_clusters,'distance','correlation','EmptyAction','singleton');

    sse_correlation=sse_correlation+sum(sse);
    cohesion_correlation=cohesion_correlation+cohesion(idx,new_data,num_of_clusters);
    separation_correlation=separation_correlation+separation(idx,new_data,num_of_clusters);
    [frequency_correlation,clusters_correlation]=cluster_identification(idx);
    freq_correlation=freq_correlation+frequency_correlation;
end

freq_correlation=freq_correlation/number_of_iterations;
sse_correlation=sse_correlation/number_of_iterations;
cohesion_correlation=cohesion_correlation/number_of_iterations;
separation_correlation=separation_correlation/number_of_iterations;

figure();
 silhouette(new_data,idx,'correlation')
 sse_correlation
 cohesion_correlation
 separation_correlation
 
