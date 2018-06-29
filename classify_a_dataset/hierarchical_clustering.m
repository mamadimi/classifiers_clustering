%% Hierarchical Clustering 
clear
clc
close all

%Init data
run('choose_data.m');

%% Correlation
Z = linkage(new_data,'ward','correlation');
number_of_iterations=5;
sse_correlation=0;
cohesion_correlation=0;
separation_correlation=0;

 idx= cluster(Z,'maxclust',8);  
 [frequency_correlation,clusters_correlation]=cluster_identification(idx);
sse_correlation=sse(idx,new_data,8);
cohesion_correlation=cohesion(idx,new_data,8);
separation_correlation=separation(idx,new_data,8);

 silhouette(new_data,idx,'correlation')
 sse_correlation
 cohesion_correlation
 separation_correlation

%% Cityblock
Z = linkage(new_data,'ward','cityblock');
number_of_iterations=5;
sse_cityblock=0;
cohesion_cityblock=0;
separation_cityblock=0;

 idx= cluster(Z,'maxclust',8); 
 [frequency_cityblock,clusters_cityblock]=cluster_identification(idx);
sse_cityblock=sse(idx,new_data,8);
cohesion_cityblock=cohesion(idx,new_data,8);
separation_cityblock=separation(idx,new_data,8);

figure()
 silhouette(new_data,idx,'cityblock')
 sse_cityblock
 cohesion_cityblock
 separation_cityblock

%% Cosine
Z = linkage(new_data,'ward','spearman');
number_of_iterations=5;
sse_spearman=0;
cohesion_spearman=0;
separation_spearman=0;

 idx= cluster(Z,'maxclust',8);  
 [frequency_spearman,clusters_spearman]=cluster_identification(idx);
sse_spearman=sse(idx,new_data,8);
cohesion_spearman=cohesion(idx,new_data,8);
separation_spearman=separation(idx,new_data,8);

figure()
 silhouette(new_data,idx,'cityblock')
 sse_spearman
 cohesion_spearman
 separation_spearman

