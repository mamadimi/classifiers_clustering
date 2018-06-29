function [Bugs_Linear Bugs_RBF]=svm_sorting(test_array,train_array,bugs,number_of_iterations,undersample_on,number_of_samples)

Bugs_Linear=zeros(size(test_array,1),1);
Bugs_RBF=zeros(size(test_array,1),1);


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
        
        Bugs_Linear=Bugs_Linear+svmclassify(svmStruct_Linear,test_array);
        Bugs_RBF=Bugs_RBF+svmclassify(svmStruct_RBF,test_array);;
 
end

Bugs_Linear=round( Bugs_Linear/number_of_iterations );
Bugs_RBF=round( Bugs_RBF/number_of_iterations );

end
