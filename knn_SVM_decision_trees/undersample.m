function [samples,sample_bugs]=undersample(number_of_samples,train_array,bugs)


%% Positions of ones in bugs array
truee=find(bugs==0);

% get random positions of ones   

position_temp = randi([1 size(truee,1)],number_of_samples,1);

%sort position_temp
position_temp = sort(position_temp);

%delete double entries
position=[];
for i=1:size(position_temp)-1
    if(position_temp(i) ~= position_temp(i+1))
        position=[position;position_temp(i)];
    end
end

%add last poition_temp element
if(position_temp( size(position_temp,1)) ~= position( size(position,1) ))
    position = [position;position_temp( size(position_temp,1))];
end

clear position_temp

number_of_samples = size(position,1);
%% Get samples - bugs == 0

position_samples = zeros(number_of_samples,1);

for i=1:number_of_samples
    position_samples(i)=truee(position(i));
end

samples=[];
for i=1:number_of_samples
    samples(i,:) = train_array(position_samples(i),:);
end
%% Get samples - bugs == 1

falsee=find(bugs==1);

for i=1:size(falsee,1)
    temp_samples(i,:) = train_array(falsee(i),:);
end

samples = [samples ; temp_samples];

clear temp_samples

sample_bugs=zeros(number_of_samples,1);
sample_bugs = [sample_bugs; ones( size(falsee,1) , 1)];