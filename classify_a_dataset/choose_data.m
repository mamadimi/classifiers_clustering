clear


load data_mat

keep_ids=[];

sz = size(metrics_data,2);
rows = size(metrics_data,1);

id = ones(1,sz);

for i=1:sz
    id(i) = i*id(i);
end

up_limit = 0.02;
down_limit = 0.98;

for j=1:sz
     summ=0;
    for i=1:rows
        if ( metrics_data(i,j) >0 )
            summ=summ+1;
        end
    end
    
    summ=summ/rows;
    
    if (summ>=up_limit && summ<=down_limit)
         keep_ids = [keep_ids j];
    end   
end

new_data = zeros(80,size(keep_ids,2));

for i=1:size(keep_ids,2)
    new_data(:,i) = metrics_data(:, keep_ids(i) );
end
alternative_data=new_data;
library_sizes=zeros(rows,1);

sz = size(new_data,2);
rows = size(new_data,1);
for i=1:rows
   for j=1:sz
       library_sizes(i)=library_sizes(i)+new_data(i,j);
   end
end    

min_lib=min(library_sizes);
library_sizes=library_sizes/min_lib;

weight_table=weights(library_sizes);
%weight_table = ones(80,1);
for i=1:rows
    new_data(i,:)=weight_table(i)*new_data(i,:);
end
