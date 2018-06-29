function [ConfM_Linear ConfM_RBF v_Linear v_RBF]=svm_testing(train_array,bugs,number_of_iterations,undersample_on,number_of_samples)

ConfM_Linear=zeros(2,2);
ConfM_RBF=zeros(2,2);


if(undersample_on==0)
     samples=train_array;
      sample_bugs=bugs;
      number_of_iterations=1;
end

for t=1:number_of_iterations
    if(undersample_on==1)
         [samples,sample_bugs]=undersample(number_of_samples,train_array,bugs);
    end
    
  
     svmStruct_Linear = svmtrain(samples,sample_bugs,'Kernel_Function','linear');
     svmStruct_RBF = svmtrain(samples,sample_bugs,'Kernel_Function','rbf','rbf_sigma',4);    
     
      v_Linear=svmclassify(svmStruct_Linear,train_array);
      v_RBF=svmclassify(svmStruct_RBF,train_array);


       ConfM_Linear = ConfM_Linear + (confusionMatrix( bugs, v_Linear));
       ConfM_RBF = ConfM_RBF + (confusionMatrix( bugs, v_RBF));
    

end

ConfM_Linear=round( ConfM_Linear/number_of_iterations );
ConfM_RBF=round( ConfM_RBF/number_of_iterations );

end
