function [Bugs_Euclidean Bugs_Cityblock]=knn_sorting(test_array,train_array,bugs,k,number_of_iterations,weight_on,undersample_on,number_of_samples)

Bugs_Euclidean=zeros(size(test_array,1),1);
Bugs_Cityblock=zeros(size(test_array,1),1);
cols=size(train_array,2);

if(undersample_on==0)
     samples=train_array;
      sample_bugs=bugs;
      number_of_iterations=1;
end


for t=1:number_of_iterations
    if(undersample_on==1)
         [samples,sample_bugs]=undersample(number_of_samples,train_array,bugs);
    end
    
    if(weight_on==0)
  
            
        Bugs_Euclidean=Bugs_Euclidean+knnclassify(test_array,samples,sample_bugs,k);
        Bugs_Cityblock=Bugs_Cityblock+knnclassify(test_array,samples,sample_bugs,k,'cityblock');
    
    elseif(weight_on==1)

        weighted_samples=zeros(size(samples));
        weighted_test=zeros(size(test_array));

        weight=weights(train_array);
        for(i=1:cols)
            weighted_samples(:,i)=samples(:,i)*weight(1,i);
        end    
        for(i=1:cols)
            weighted_test(:,i)=test_array(:,i)*weight(1,i);
        end   

        Bugs_Euclidean=Bugs_Euclidean+knnclassify(weighted_test,weighted_samples,sample_bugs,k);
        Bugs_Cityblock=Bugs_Cityblock+knnclassify(weighted_test,weighted_samples,sample_bugs,k,'cityblock');


  

    end

end

Bugs_Euclidean=round( Bugs_Euclidean/number_of_iterations );
Bugs_Cityblock=round( Bugs_Cityblock/number_of_iterations );

end
