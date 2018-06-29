function weight_table=weights(train_array)
cols= size(train_array,2);
weight_table=zeros(1,cols);
total=0;
total_2=0;
new_dataset=zeros(size(train_array));
for(i=1:cols)
    total=total+std(train_array(:,i));
    total_2=total_2+mean(train_array(:,i));
end
for(i=1:cols)
   weight_table(1,i)=total./(std(train_array(:,i))*cols);
   weight_table(1,i)=weight_table(1,i)+total_2./(mean(train_array(:,i))*cols); 
end
weight_table=weight_table/sum(weight_table);


end