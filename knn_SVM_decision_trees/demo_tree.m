clear
clc
load bugs
number_of_iterations =50;

%%model (1,:)= all variables, model (2,:)= public, model (3,:)= private
% model(:,1) =train_array  model(:,2) =test_aray
train_array=model(1,1);
test_array=model(1,2);

%% tree_testing  - undersample_on = 0 
fprintf(' tree_testing - undersample_on = 0 ')
[ConfM_gini ConfM_dev]=tree_testing(train_array,bugs,number_of_iterations,0,0)

precision_gini=precisionM(ConfM_gini)
recall_gini=recallM(ConfM_gini)
acccuracy_gini=accuracy(ConfM_gini)
fmeasure_gini=fmeasure(ConfM_gini)

precision_dev=precisionM(ConfM_dev)
recall_dev=recallM(ConfM_dev)
acccuracy_dev=accuracy(ConfM_dev)
fmeasure_dev=fmeasure(ConfM_dev)

%% tree_testing  - undersample_on = 1 -Corrected Class Imbalance
fprintf('tree_testing  - undersample_on = 1 ')
[ConfM_gini ConfM_dev]=tree_testing(train_array,bugs,number_of_iterations,1,200)

precision_gini=precisionM(ConfM_gini)
recall_gini=recallM(ConfM_gini)
acccuracy_gini=accuracy(ConfM_gini)
fmeasure_gini=fmeasure(ConfM_gini)

precision_dev=precisionM(ConfM_dev)
recall_dev=recallM(ConfM_dev)
acccuracy_dev=accuracy(ConfM_dev)
fmeasure_dev=fmeasure(ConfM_dev)


%% tree_sorting  - undersample_on = 0 
fprintf(' tree_sorting  - undersample_on = 0 \n')
[Bugs_gini1 Bugs_dev1]=tree_sorting(test_array, train_array,bugs,number_of_iterations,0,0);

%% tree_sorting  - undersample_on = 1  -Corrected Class Imbalance
fprintf(' tree_sorting  - undersample_on = 1 \n')
[Bugs_gini2 Bugs_dev2]=tree_sorting(test_array, train_array,bugs,number_of_iterations,1,200);





