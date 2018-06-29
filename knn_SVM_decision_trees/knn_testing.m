function [ConfM_Euclidean ConfM_Cityblock v_Euclidean v_Cityblock] =knn_testing(train_array,bugs,k,number_of_iterations,weight_on,undersample_on,number_of_samples)

ConfM_Euclidean=zeros(2,2);
ConfM_Cityblock=zeros(2,2);
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
  
            
        v_Euclidean=knnclassify(train_array,samples,sample_bugs,k);
        v_Cityblock=knnclassify(train_array,samples,sample_bugs,k,'cityblock');


         ConfM_Euclidean = ConfM_Euclidean + (confusionMatrix( bugs, v_Euclidean));
         ConfM_Cityblock = ConfM_Cityblock + (confusionMatrix( bugs, v_Cityblock));
    
    elseif(weight_on==1)

        weighted_samples=zeros(size(samples));
        weighted_train=zeros(size(train_array));

        weight=weights(train_array);
        for(i=1:cols)
            weighted_samples(:,i)=samples(:,i)*weight(1,i);
        end    
        for(i=1:cols)
            weighted_train(:,i)=train_array(:,i)*weight(1,i);
        end    


        v_Euclidean=knnclassify(weighted_train,weighted_samples,sample_bugs,k);
        v_Cityblock=knnclassify(weighted_train,weighted_samples,sample_bugs,k,'cityblock');


        ConfM_Euclidean = ConfM_Euclidean + (confusionMatrix( bugs, v_Euclidean));
        ConfM_Cityblock = ConfM_Cityblock + (confusionMatrix( bugs, v_Cityblock));

    end

end

ConfM_Euclidean=round( ConfM_Euclidean/number_of_iterations );
ConfM_Cityblock=round( ConfM_Cityblock/number_of_iterations );

end
