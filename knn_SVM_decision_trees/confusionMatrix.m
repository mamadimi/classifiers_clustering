function ConfM = confusionMatrix( bugs, algorithmOutput )


ConfM = zeros(2,2);

for i=1:length(bugs)
    if(bugs(i)==0 & algorithmOutput(i)==0)
        ConfM(1,1)=ConfM(1,1)+1;
    end
    if(bugs(i)==0 & algorithmOutput(i)==1)
        ConfM(1,2)=ConfM(1,2)+1;
    end
    if(bugs(i)==1 & algorithmOutput(i)==0)
        ConfM(2,1)=ConfM(2,1)+1;
    end
    if(bugs(i)==1 & algorithmOutput(i)==1)
        ConfM(2,2)=ConfM(2,2)+1;
    end
end
end

