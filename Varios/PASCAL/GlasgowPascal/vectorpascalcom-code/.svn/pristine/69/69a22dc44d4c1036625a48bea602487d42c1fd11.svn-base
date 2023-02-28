MA/parser/Parser.java: MA.sab
	sablecc MA.sab

MAc.class: MAc.java MA/parser/Parser.java
	javac MAc.java
 
test: MAc.class
	mac tinyproc.ma

all: MAc.class
