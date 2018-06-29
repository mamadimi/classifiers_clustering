function acc = accuracy( ConfM )

acc =( ConfM(1,1)+ConfM(2,2) )/(ConfM(1,1)+ConfM(1,2)+ConfM(2,1)+ConfM(2,2));

end

