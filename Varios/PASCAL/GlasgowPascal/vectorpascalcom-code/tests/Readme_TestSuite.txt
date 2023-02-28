Here is a description of how work the different scripts and how to run them.

First is the description of each script involved in the building procedure.


* build_run_test_suite.bat : is a windows batch file which compiles and runs a whole test suite for a specific compiler and architecture
This script also build the spredsheet and a skeleton of the latex report (if it doesnt exists) and packages everything into a directory
To achieve this, it uses three other script :
	build_run_test.pat
	buildReport.pl
	test.pl

Here is how to run this script :

	build_run-test-suite.bat compName conformanceTestDirectory CPU1 CPU2 ...
where
	compName is a name of a compiler between :
		- vp -> Vector Pascal
		- tp7 -> Turbo Pascal 7
		- gpc -> Gnu Pascal
		- ipc -> Irie Pascal 
		- fpc -> Free Pascal
	conformanceTestDirectory is the directory which contains the test
	CPU1 is the target CPU, you can define more than one target CPU.

for example :
	 build_run-test-suite.bat vp CONFORM P3 P4

* build_run_test.bat : is a windows batch file which compiles and runs a defined test for a specific compiler and architecture
Here is how to use this script :

	build_run_test.bat compName testSuiteDir CPU testName
where 
	compName is a name of a compiler between :
		- vp -> Vector Pascal
		- tp7 -> Turbo Pascal 7
		- gpc -> Gnu Pascal
		- ipc -> Irie Pascal 
		- fpc -> Free Pascal
	testSuiteDire is the directory which contains the test
	CPU is the target CPU ()
	testName is the name of the test (conf002 for example)


* buildReport.pl : is a perl script which build an html report and the skeleton of a latex report for a specified test suite.
This script doesnt need any parameter.
buildReport will generate a html page containing the spredsheet, and also a skeleton of a latex report.
This skeleton is divided into several part.
The main document (CONFORM-report.tex for example) contains likes to the other part.
The other parts are in the CONFORM-file directory. There is one tex file per test. There also is intro.tex which contains an introduction


* test.pl : is a perl script which gather everything needed for the web site into the ISO_report direcory
This script doesnt need any parameter.
test.pl gather everything into the ISO_report directory. It also compiles the latex report into a dvi file, and then convert it into 
a pdf report.
It also generates an html file which contains like to each pdf report and spredsheet.


Using these script will produce several new directory :
Report :
	contains the spredsheet for each test suite (html/CONFORM.htm, html/VECTOR.htm).
	contains the latex report in the latex directory. Each latex report is made of several files (in CONFORM-file for CONFORM test suite) and an "entry point" : CONFORM-report.tex (or VECTOR-report.tex)

testProgSuite :
	contains executable for each test of each test suite.

testReportSuite :
	contains a xml file for each test of each test suite. This xml file contains output of the compilation and execution step of the test.

ISO_report :
	contains these three directory above, in addition to each test suite, and an generated index.html file to simplify browsing 