all: Mac.class Mac.jar install
	
install: Mac.jar
	cp Mac.jar ../../../mmpc
	cp mac ../../../mmpc

Mac.jar: Mac.class
	jar -cmf Manifest.txt Mac.jar   Mac *.class
        
 Mac.class: Mac.java Mac/node/Node.java
	javac Mac.java
        
Mac/node/Node.java: MacLex.sab
	sablecc MacLex.sab

clean:
	rm Mac/node/*
	
test: Mac.class
#	java Mac ../../Tests/in.m
	java Mac ../../Tests/temperature.m 
                
