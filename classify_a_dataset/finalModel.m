%% Final Model


clear
clc
close all

%Init data
run('choose_data.m');

%% Kmeans - Correlation - 8 clusters
number_of_iterations=20;
sse_correlation=0;
cohesion_correlation=0;
separation_correlation=0;

freq_correlation=zeros(8,1);
num_of_clusters = 8;
%Iterations are utilized in order to get more accurate values for the metrics used. 
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
 
 
 