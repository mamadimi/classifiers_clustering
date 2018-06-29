function [ConfM_gini ConfM_dev]=tree_testing(train_array,bugs,number_of_iterations,undersample_on,number_of_samples)

ConfM_gini=zeros(2,2);
ConfM_dev=zeros(2,2);


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
        
       v_gini=predict(tc_gini,train_array);
       v_dev=predict(tc_dev,train_array);


       ConfM_gini = ConfM_gini + (confusionMatrix( bugs, v_gini));
       ConfM_dev = ConfM_dev + (confusionMatrix( bugs, v_dev));
    

end

ConfM_gini=round( ConfM_gini/number_of_iterations );
ConfM_dev=round( ConfM_dev/number_of_iterations );

end
