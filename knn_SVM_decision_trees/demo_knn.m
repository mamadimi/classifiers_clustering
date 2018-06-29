clear
clc
load bugs

k=4;
number_of_iterations =100;

%%model (1,:)= all variables, model (2,:)= public, model (3,:)= private
% model(:,1) =train_array  model(:,2) =test_aray
train_array=model(1,1);
test_array=model(1,2);

%% Knn_testing - k=4 - undersample_on = 0 - weight_on = 0
fprintf(' Knn_testing - k=4 - undersample_on = 0 - weight_on = 0')
[ConfM_Euclidean ConfM_Cityblock]=knn_testing(train_array,bugs,k,number_of_iterations,0,0,0)

precision_Euclidean=precisionM(ConfM_Euclidean)
recall_Euclidean=recallM(ConfM_Euclidean)
acccuracy_Euclidean=accuracy(ConfM_Euclidean)
fmeasure_Euclidean=fmeasure(ConfM_Euclidean)

precision_Cityblock=precisionM(ConfM_Cityblock)
recall_Cityblock=recallM(ConfM_Cityblock)
acccuracy_Cityblock=accuracy(ConfM_Cityblock)
fmeasure_Cityblock=fmeasure(ConfM_Cityblock)

%% Knn_testing - k=4 - undersample_on = 1 - weight_on = 0 -Corrected Class Imbalance
fprintf(' Knn_testing - k=4 - undersample_on = 1 - weight_on = 0')
[ConfM_Euclidean ConfM_Cityblock]=knn_testing(train_array,bugs,k,number_of_iterations,0,1,200)

precision_Euclidean=precisionM(ConfM_Euclidean)
recall_Euclidean=recallM(ConfM_Euclidean)
acccuracy_Euclidean=accuracy(ConfM_Euclidean)
fmeasure_Euclidean=fmeasure(ConfM_Euclidean)

precision_Cityblock=precisionM(ConfM_Cityblock)
recall_Cityblock=recallM(ConfM_Cityblock)
acccuracy_Cityblock=accuracy(ConfM_Cityblock)
fmeasure_Cityblock=fmeasure(ConfM_Cityblock)

%% Knn_testing - k=4 - undersample_on = 0 - weight_on = 1 -Corrected Scale Difference
fprintf(' Knn_testing - k=4 - undersample_on = 0 - weight_on = 1')
[ConfM_Euclidean ConfM_Cityblock]=knn_testing(train_array,bugs,k,number_of_iterations,1,0,0)

precision_Euclidean=precisionM(ConfM_Euclidean)
recall_Euclidean=recallM(ConfM_Euclidean)
acccuracy_Euclidean=accuracy(ConfM_Euclidean)
fmeasure_Euclidean=fmeasure(ConfM_Euclidean)

precision_Cityblock=precisionM(ConfM_Cityblock)
recall_Cityblock=recallM(ConfM_Cityblock)
acccuracy_Cityblock=accuracy(ConfM_Cityblock)
fmeasure_Cityblock=fmeasure(ConfM_Cityblock)

%% Knn_testing - k=4 - undersample_on = 1 - weight_on = 1 -Corrected Class Imbalance, Scale Difference
fprintf(' Knn_testing - k=4 - undersample_on = 1 - weight_on = 1')
[ConfM_Euclidean ConfM_Cityblock]=knn_testing(train_array,bugs,k,number_of_iterations,1,1,200)

precision_Euclidean=precisionM(ConfM_Euclidean)
recall_Euclidean=recallM(ConfM_Euclidean)
acccuracy_Euclidean=accuracy(ConfM_Euclidean)
fmeasure_Euclidean=fmeasure(ConfM_Euclidean)

precision_Cityblock=precisionM(ConfM_Cityblock)
recall_Cityblock=recallM(ConfM_Cityblock)
acccuracy_Cityblock=accuracy(ConfM_Cityblock)
fmeasure_Cityblock=fmeasure(ConfM_Cityblock)


%% Knn_sorting - k=4 - undersample_on = 0 - weight_on = 0
fprintf(' Knn_sorting - k=4 - undersample_on = 0 - weight_on = 0\n')
[Bugs_Euclidean1 Bugs_Cityblock1]=knn_sorting(test_array, train_array,bugs,k,number_of_iterations,0,0,0);

%% Knn_sorting - k=4 - undersample_on = 1 - weight_on = 0 -Corrected Class Imbalance
fprintf(' Knn_sorting - k=4 - undersample_on = 1 - weight_on = 0\n')
[Bugs_Euclidean2 Bugs_Cityblock2]=knn_sorting(test_array, train_array,bugs,k,number_of_iterations,0,1,200);

%% Knn_sorting - k=4 - undersample_on = 0 - weight_on = 1 -Corrected Scale Difference
fprintf(' Knn_sorting - k=4 - undersample_on = 0 - weight_on = 1\n')
[Bugs_Euclidean3 Bugs_Cityblock3]=knn_sorting(test_array, train_array,bugs,k,number_of_iterations,1,0,0);

%% Knn_sorting - k=4 - undersample_on = 1 - weight_on = 1 -Corrected Class Imbalance, Scale Difference
fprintf(' Knn_sorting - k=4 - undersample_on = 1 - weight_on = 1\n')
[Bugs_Euclidean4 Bugs_Cityblock4]=knn_sorting(test_array, train_array,bugs,k,number_of_iterations,1,1,200);



