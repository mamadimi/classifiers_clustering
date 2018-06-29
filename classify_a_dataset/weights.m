function weight_table=weights(library_sizes)
cols= size(library_sizes,1);
weight_table=zeros(cols,1);

total = sum(library_sizes);

for(i=1:cols)
   weight_table(i,1)=total./(library_sizes(i));
end
weight_table=weight_table/sum(weight_table);


end