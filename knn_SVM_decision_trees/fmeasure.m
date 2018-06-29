function fmeasur = fmeasure( ConfM )

fmeasur = 2*(recallM(ConfM)*precisionM(ConfM) )/( recallM(ConfM)+precisionM(ConfM) ) ;

end


