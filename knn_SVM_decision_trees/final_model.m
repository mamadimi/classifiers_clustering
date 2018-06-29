clear
clc
load bugs

k=4;
number_of_iterations =100;

train_array=model(1,1);

%% Knn_testing - k=4 - undersample_on = 1 - weight_on = 1 -Corrected Class Imbalance, Scale Difference
fprintf(' Knn_testing - k=4 - undersample_on = 1 - weight_on = 1')
 [ConfM_Euclidean ConfM_Cityblock v_Euclidean v_Cityblock] =knn_testing(train_array,bugs,k,number_of_iterations,1,1,200);

  
%% svm_testing  - undersample_on = 1 -Corrected Class Imbalance
fprintf('svm_testing  - undersample_on = 1 ')
[ConfM_Linear ConfM_RBF v_Linear v_RBF]=svm_testing(train_array,bugs,number_of_iterations/4,1,200);

different_Results=find(v_Cityblock ~= v_RBF);
final_Bugs=v_RBF;

for i=1:size(different_Results,1)

final_Bugs(different_Results(i)) =  v_Euclidean(different_Results(i));

end

ConfM_Euclidean 

ConfM_Cityblock 

ConfM_RBF

ConfM_Hybrid = confusionMatrix( bugs, final_Bugs )

Cost_Euclidean = Cost(ConfM_Euclidean)

Cost_Cityblock = Cost(ConfM_Cityblock)

Cost_RBF = Cost(ConfM_RBF)

Cost_Hybrid = Cost(ConfM_Hybrid)

precision_Hybrid=precisionM(ConfM_Hybrid)
recall_Hybrid=recallM(ConfM_Hybrid)
acccuracy_Hybrid=accuracy(ConfM_Hybrid)
fmeasure_Hybrid=fmeasure(ConfM_Hybrid)

final_Bugs_Testing=final_Bugs;

%%  Test file Sorting
fprintf('Test file Sorting')

k=4;
number_of_iterations =100;

train_array=model(1,1);
test_array=model(1,2);

%% Knn_sorting - k=4 - undersample_on = 1 - weight_on = 1 -Corrected Class Imbalance, Scale Difference
fprintf(' Knn_sorting - k=4 - undersample_on = 1 - weight_on = 1\n')
[Bugs_Euclidean Bugs_CityBlock]=knn_sorting(test_array, train_array,bugs,k,number_of_iterations,1,1,200);


%% svm_sorting  - undersample_on = 1  -Corrected Class Imbalance
fprintf(' svm_sorting  - undersample_on = 1 \n')
[Bugs_Linear Bugs_RBF]=svm_sorting(test_array, train_array,bugs,number_of_iterations/4,1,200);

different_Results=find(Bugs_CityBlock ~= Bugs_RBF);

final_Bugs=Bugs_CityBlock;

for i=1:size(different_Results,1)

final_Bugs(different_Results(i)) =  Bugs_Euclidean(different_Results(i));

end


final_Bugs;






