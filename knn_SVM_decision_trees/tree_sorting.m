function [Bugs_gini Bugs_dev]=tree_sorting(test_array,train_array,bugs,number_of_iterations,undersample_on,number_of_samples)

Bugs_gini=zeros(size(test_array,1),1);
Bugs_dev=zeros(size(test_array,1),1);


if(undersample_on==0)
     samples=train_array;
      sample_bugs=bugs;
      number_of_iterations=1;
end

for t=1:number_of_iterations
    if(undersample_on==1)
         [samples,sample_bugs]=undersample(number_of_samples,train_array,bugs);
    end
      tc_gini = ClassificationTree.fit(samples,sample_bugs,'SplitCriterion','gdi');
      tc_dev = ClassificationTree.fit(samples,sample_bugs,'SplitCriterion','deviance');
        
       Bugs_gini=Bugs_gini+predict(tc_gini,test_array);
       Bugs_dev=Bugs_dev+predict(tc_dev,test_array);
 
end

Bugs_gini=round( Bugs_gini/number_of_iterations );
Bugs_dev=round( Bugs_dev/number_of_iterations );

end
