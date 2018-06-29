function cost = Cost( ConfM )

cost = 0*ConfM(1,1) -ConfM(2,2) + 15*ConfM(1,2) + 10*ConfM(2,1);

end

