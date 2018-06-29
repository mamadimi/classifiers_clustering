clear
clc
close all

run('choose_data.m');
load('idx_som.mat');

%% SOM clustering
figure();
 silhouette(new_data,idx_som,'correlation')
cohesion_som=cohesion(idx_som,new_data,9)
separation_som=separation(idx_som,new_data,9)
sse_som=mysse(idx_som,new_data,9)
[frequency_som,clusters_som]=cluster_identification(idx_som);