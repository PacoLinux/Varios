#! perl

use strict; use warnings;

my @repListReportSuite;
my @testSuiteDir;

my @copyCommand;

my @latexCommand;

my %testName;

print "test.pl running";
 
opendir(REPORTDIR, "testReportSuite");

@repListReportSuite = readdir(REPORTDIR); 
closedir REPORTDIR;
print"make a directory for the output\n";
mkdir "ISO_report" unless -e "ISO_report";

print"execute copy\n";
@copyCommand = ("xcopy","/Y","/E","/I",  "testReportSuite", "ISO_report\\testReportSuite");
system(@copyCommand);
print "first copy done\n";
@copyCommand = ("xcopy","/Y","/E","/I", "Reports", "ISO_report\\Reports");
system(@copyCommand);

print "second copy done\n";


open(TESTFILE, '>', "ISO_report\\index.html");
			print TESTFILE "<html><body>\n";
			

foreach my $repReport (@repListReportSuite) {
	
	if ($repReport ne "." && $repReport ne ".." && $repReport !~ m/.*\..*/) {
		# directories are namesd like that : compiler_testSuiteName_CPU
		$repReport =~ m/([^_]+)_([A-Za-z0-9]+)_([^_]+)/;
		
		$testName{$2} = $2;
		
		
	
	}
	

}

foreach my $repReport (keys %testName) {
		@copyCommand = ("xcopy","/Y","/E","/I",  $repReport, "ISO_report\\$repReport");
		
		system(@copyCommand);
		print TESTFILE "<a href='Reports/html/$repReport.htm'>here</a>is a spreadsheet for the $repReport test suite<br/>";
	
		#generate the dvi report
		chdir("ISO_report\\Reports\\latex\\");
		@latexCommand = ("pdflatex", $repReport."-report.tex");
#		system(@latexCommand);
		
		# convert it into a pdf file
	#	@latexCommand = ("dvipdft", $repReport."-report.dvi");
	#	system(@latexCommand);
		
		#add a link
		print TESTFILE "<a href='Reports/latex/$repReport"."-report.pdf'>here</a>is a pdf report for the $repReport test suite<br/>";
		
		chdir("..\\..\\..\\");
		#@copyCommand = ("xcopy", $repReport, "ISO_report\\$2");

}
print TESTFILE "</body></html>\n";
close TESTFILE;

