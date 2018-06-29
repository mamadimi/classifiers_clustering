function array=model(type,array_id)
if(array_id==1)
    load('train.mat');
elseif(array_id==2)
      load('test.mat');
end

if(type==1)
     fprintf(' All_Variables model \n')
    array = [cbo dit fanIn fanOut lcom noc numberOfAttributes numberOfAttributesInherited numberOfLinesOfCode numberOfMethods numberOfMethodsInherited numberOfPrivateAttributes numberOfPrivateMethods numberOfPublicAttributes numberOfPublicMethods rfc wmc];
elseif(type==2)
    fprintf(' Public model \n')
    array=[fanIn numberOfPublicAttributes numberOfAttributesInherited numberOfPublicMethods numberOfMethodsInherited fanOut lcom noc cbo];
elseif(type==3)
    fprintf(' Private model \n')
    array=[  fanIn numberOfPrivateAttributes numberOfAttributesInherited numberOfPrivateMethods numberOfMethodsInherited fanOut lcom ];
end

end