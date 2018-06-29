clear
clc
load bugs


number_of_iterations =50;

%%model (1,:)= all variables, model (2,:)= public, model (3,:)= private
% model(:,1) =train_array  model(:,2) =test_aray
train_array=model(1,1);
test_array=model(1,2);

%% svm_testing  - undersample_on = 0 
fprintf(' svm_testing - undersample_on = 0 ')
[ConfM_Linear ConfM_RBF]=svm_testing(train_array,bugs,number_of_iterations,0,0)

precision_Linear=precisionM(ConfM_Linear)
recall_Linear=recallM(ConfM_Linear)
acccuracy_Linear=accuracy(ConfM_Linear)
fmeasure_Linear=fmeasure(ConfM_Linear)

precision_RBF=precisionM(ConfM_RBF)
recall_RBF=recallM(ConfM_RBF)
acccuracy_RBF=accuracy(ConfM_RBF)
fmeasure_RBF=fmeasure(ConfM_RBF)

%% svm_testing  - undersample_on = 1 -Corrected Class Imbalance
fprintf('svm_testing  - undersample_on = 1 ')
[ConfM_Linear ConfM_RBF]=svm_testing(train_array,bugs,number_of_iterations,1,200)

precision_Linear=precisionM(ConfM_Linear)
recall_Linear=recallM(ConfM_Linear)
acccuracy_Linear=accuracy(ConfM_Linear)
fmeasure_Linear=fmeasure(ConfM_Linear)

precision_RBF=precisionM(ConfM_RBF)
recall_RBF=recallM(ConfM_RBF)
acccuracy_RBF=accuracy(ConfM_RBF)
fmeasure_RBF=fmeasure(ConfM_RBF)


%% svm_sorting  - undersample_on = 0 
fprintf(' svm_sorting  - undersample_on = 0 \n')
[Bugs_Linear1 Bugs_RBF1]=svm_sorting(test_array, train_array,bugs,number_of_iterations,0,0);

%% svm_sorting  - undersample_on = 1  -Corrected Class Imbalance
fprintf(' svm_sorting  - undersample_on = 1 \n')
[Bugs_Linear2 Bugs_RBF2]=svm_sorting(test_array, train_array,bugs,number_of_iterations,1,200);



