#/usr/bin/bash
echo "Test results\n">Testoutput;
 for file in *.pas; 
 do 
	 	 	FN=${file/.pas/ } ;
	 	 	 
	 	 	echo ${FN};
	 	 	 
	 	 	${FN} |tee -a Testoutput;			
done;

 
		 
