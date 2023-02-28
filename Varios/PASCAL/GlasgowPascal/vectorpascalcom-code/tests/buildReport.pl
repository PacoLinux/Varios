#! perl

use strict; use warnings;


my $compiler1 = "tp7";
my $compiler2 = "vp";


my $nbTestMax = 0;
my $nbCol =0;

my @reportFileList;
my $reportFileName;
my %testSuiteNameSet; 


my %testTab;



sub writeLatex {
	my ($testInformation) = @_;
	if (not -e "$$testInformation{'testSuiteName'}-file/$$testInformation{'testName'}.tex") {
		#print "$testSuiteName-file\\$$testInformation{'testName'}.tex";
		open(TESTFILE, '>', "$$testInformation{'testSuiteName'}-file/$$testInformation{'testName'}.tex");
			print TESTFILE "/section{$$testInformation{'testName'}}\n";
			print TESTFILE "/paragraph*{Description}\n";
			
			# getting the description of the test and the conformance level
			open(TESTSOURCE, '<', "../../$$testInformation{'testSuiteName'}/$$testInformation{'testName'}.pas");
			my @line = <TESTSOURCE>;
			my $conformanceLevel = 0;
			close TESTSOURCE;
			foreach my $desc (@line) {
				
				if ($desc =~ m/{:(.*)}/) {
					print TESTFILE "$1\n";
				}
				if ($desc =~ m/LEVEL=([0-9])/) {
					$conformanceLevel  = $1;
				}
			}
			
			print TESTFILE "\n\\paragraph*{Conformance level} $conformanceLevel\n\n";
			
			
			#getting why the test fails
			print TESTFILE "\\paragraph*{}\n";
			
			my $cellValue = "";						
			foreach my $arrayElem (@{$$testInformation{'compOutput'}}) {
				$cellValue .= $arrayElem; }
		
			if ($$testInformation{'compilationResult'}[0] !~ m/success/i) {
					print TESTFILE "This test fails on compilation time, on line ";
					$cellValue =~ m/ Error ([0-9]+),/i;
					print TESTFILE "$1 :\n\n";
					print TESTFILE "\\begin{verbatim}\n";
					
					print TESTFILE "$line[$1-1]\n";
					print TESTFILE "\\end{verbatim}\n";
					
					
			} else {
				print TESTFILE "This test fails on execution time\n";
			}
			
			#getting why the test fails
			print TESTFILE "\\paragraph*{Other compilers}\n";
			print TESTFILE "\\begin{itemize}\n";
			$$testInformation{'testName'} =~ m/[^0-9]+([0-9]+)/ ;
			my $testNumber = $1;
			for( my $j=2; $j <= $#{$testTab{$$testInformation{'testSuiteName'}}[$testNumber+3]}; $j +=2) {
				
				
				if (defined $testTab{$$testInformation{'testSuiteName'}}[$testNumber+3][$j][1]  ) {
				
				if($testTab{$$testInformation{'testSuiteName'}}[$testNumber+3][$j][1] !~ m/success/i) {
					#print "$testNumber $testTab{$$testInformation{'testSuiteName'}}[$testNumber+3][$j][1]\n";
				
					print TESTFILE "\\item $testTab{$$testInformation{'testSuiteName'}}[$testNumber+3][$j][0]{'compName'}\n";
				}}
			}
			print TESTFILE "\\end{itemize}\n";
		close TESTFILE;
		
	}
}

# this function goes on the directories which contains build Report, and return a list of the report file.
# it also  creates the set of test-suite/cpu/compiler -> testSuiteNameSet

sub getReportFileNameList {
	my @reportFileList;
	my @repListReportSuite;
	my @reportList;

	my $repReport;
	my $report;
	
	opendir(REPORTDIR, "testReportSuite");

	@repListReportSuite = readdir(REPORTDIR); 
	closedir REPORTDIR;

	foreach $repReport (@repListReportSuite) {
		
		if ($repReport ne "." && $repReport ne ".." && $repReport !~ m/.*\..*/) {
			print "$repReport\n";
			# directories are namesd like that : compiler_testSuiteName_CPU
			$repReport =~ m/([^_]+)_([A-Za-z0-9]+)_([^_]+)/;	
			
			$testSuiteNameSet{$2}{$1}{$3} = 0;
			
			opendir(REPO, "testReportSuite/$repReport");
			@reportList = readdir(REPO);
			closedir REPO;
			
			foreach $report (@reportList) {
				if ($report ne "." && $report ne ".." ) {
					push @reportFileList, ("testReportSuite/$repReport/$report");
				}
			}
		}
	}
	
	
	# triing to put a column number on each couple compiler-architecture
	foreach my $keyTestSuite (keys %testSuiteNameSet) {
		my $col = 2;
		foreach my $CPU (keys %{$testSuiteNameSet{$keyTestSuite}{$compiler1}}) {
			$testSuiteNameSet{$keyTestSuite}{$compiler1}{$CPU} = $col;
			$col += 2;
		}
		$col += 2;
		foreach my $CPU (keys %{$testSuiteNameSet{$keyTestSuite}{$compiler2}}) {
			$testSuiteNameSet{$keyTestSuite}{$compiler2}{$CPU} = $col;
			$col += 2;
		}
		$col += 4;
		foreach my $keyComp (keys %{$testSuiteNameSet{$keyTestSuite}}) {
			if ($keyComp ne $compiler1 && $keyComp ne $compiler2) {
				print $keyComp;
				foreach my $CPU (keys %{$testSuiteNameSet{$keyTestSuite}{$keyComp}}) {
					$testSuiteNameSet{$keyTestSuite}{$keyComp}{$CPU} = $col;
					$col += 2;
				}
			}
			$col += 2;
		}
	}
	
	
	
	
	return @reportFileList;
}

#this function take a liste of report file and extract information.
# it thne put information into a hierarchical hash table structure
sub extractInfo {
	# information extracted from the report  file
	

	# information tree using hashtable
	my %infoTree;
	
	foreach $reportFileName (@reportFileList) {
		my @report = (0);
		my @testName = (0);
		my @testSuiteName = (0);
		my @cpuName = (0);
		my @compName = (0);
		my @compOutput = (0);
		my @javaOutput = (0);
		my @compilationResult = (0); 
		my @executionResult = (0);
		
		open(REPORT, $reportFileName);
		@report = <REPORT>;
		close(REPORT);
		
		# getting the test info
		@testName = grep(s/<testName>(.*)<\/testName>/$1/g, @report );
		#print $testName[0];
		#$testName[0] =~ m/[^A-Za-z0-9]*([A-Za-z0-9]*)[^A-Za-z0-9]*/x;
		$testName[0] =~ m/([A-Za-z0-9_]+)/x;
		$testName[0] = $1;
		#$testName[0] =~ tr/A-Z/a-z/;
		#print $testName[0];
		@testSuiteName = grep(s/<testSuiteName>(.*)<\/testSuiteName>/$1/g, @report );
		$testSuiteName[0] =~ m/([A-Za-z0-9_]+)/;
		$testSuiteName[0] = $1;
		#print $testSuiteName[0];
		@cpuName = grep(s/<cpuName>(.*)<\/cpuName>/$1/g, @report );
		#print $cpuName[0];
		$cpuName[0] =~ m/([A-Za-z0-9_]+)/;
		$cpuName[0] = $1;
		#print $cpuName[0];
		@compName = grep(s/<compilerName>(.*)<\/compilerName>/$1/g, @report );
		$compName[0] =~ m/([A-Za-z0-9_]+)/;
		$compName[0] = $1;
		# print $compName[0] . "\n";
		@compOutput = grep(s/<compilationOutputLine>(.*)<\/compilationOutputLine>/$1/g, @report );
		#print $compOutput[0];
		@javaOutput = grep(s/<javaOutputLine>(.*)<\/javaOutputLine>/$1/g, @report );
		#print $javaOutput[0];
		@compilationResult = grep(s/<compilationResult>(.*)<\/compilationResult>/$1/g, @report );
		#print $compilationResult [0];
		@executionResult = grep(s/<executionResultLine>(.*)<\/executionResultLine>/$1/g, @report );
		#print $executionResult [0];
		
		# put data into the hierachised hash table
		$infoTree{$testSuiteName[0]}{$testName[0]}{$compName[0]}{$cpuName[0]} =  
		 {'testName' => $testName[0],
			 'testSuiteName' => $testSuiteName[0],
			 'cpuName' => $cpuName[0],
			 'compName'=> $compName[0],
			 'compOutput' => \@compOutput, 
			 'javaOutput' => \@javaOutput,
			 'compilationResult' => \@compilationResult,
			 'executionResult' => \@executionResult};
			 
		# put data in the tab
		$testName[0] =~ m/([0-9]+)/;
		my $nbTest = $1+3;
		
		print $testSuiteName[0] . "," . $nbTest  . "," . $testSuiteName[0] . "," . $compName[0] . "," . $cpuName[0] . "," . $testName[0]. ", " . $testSuiteNameSet{$testSuiteName[0]}{$compName[0]}{$cpuName[0]} . ", \n";


		$testTab{$testSuiteName[0]}[$nbTest][$testSuiteNameSet{$testSuiteName[0]}{$compName[0]}{$cpuName[0]}][0] = 
					$infoTree{$testSuiteName[0]}{$testName[0]}{$compName[0]}{$cpuName[0]};
		
		my $cellValue = "";						
		foreach my $arrayElem (@compilationResult) {
			$cellValue .= $arrayElem; }
		
		$testTab{$testSuiteName[0]}[$nbTest][$testSuiteNameSet{$testSuiteName[0]}{$compName[0]}{$cpuName[0]}][1] = $cellValue;

		$testTab{$testSuiteName[0]}[$nbTest][$testSuiteNameSet{$testSuiteName[0]}{$compName[0]}{$cpuName[0]}+1] [0] = 
					$infoTree{$testSuiteName[0]}{$testName[0]}{$compName[0]}{$cpuName[0]};
		
		
		$cellValue = "";						
		foreach my $arrayElem (@executionResult) {
			$cellValue .= $arrayElem; }
		$testTab{$testSuiteName[0]}[$nbTest][$testSuiteNameSet{$testSuiteName[0]}{$compName[0]}{$cpuName[0]}+1] [1] = $cellValue;
		
		#$testTab{$testSuiteName[0]}[$nbTest][$testSuiteNameSet{$testSuiteName[0]}{$compName[0]}{$cpuName[0]}+2] [1] = '+';
		
		$testTab{$testSuiteName[0]}[$nbTest][0][0] = $infoTree{$testSuiteName[0]}{$testName[0]}{$compName[0]}{$cpuName[0]};
		$testTab{$testSuiteName[0]}[$nbTest][0][1] = $testName[0];
		

	}
	return %infoTree;
}

# get the file name
@reportFileList = getReportFileNameList;

#get the information
my %infoTree = extractInfo;

my %errorDescriptionI; # contains important errors
my %errorDescription; # contains less important errors

print "----------------------\n";


mkdir "Reports" if not -e "Reports";
mkdir "Reports/html" if not -e "Reports/html";
mkdir "Reports/latex" if not -e "Reports/latex" ;

chdir("Reports/html");
# creating the html file
#####################################################################
foreach my $testSuiteName (keys %testTab) {

	
	
	#writing tables header
	foreach my $compKey  (sort keys %{$testSuiteNameSet{$testSuiteName}}) {
		#if ($compKey ne $compiler1 && $compKey ne $compiler2  ) {
			foreach my $cpuKey (sort keys %{$testSuiteNameSet{$testSuiteName}{$compKey}} ) {
				#print "$testSuiteName $compKey $cpuKey\n";
				$testTab{$testSuiteName}[0][$testSuiteNameSet{$testSuiteName}{$compKey}{$cpuKey}][1]  = $compKey;
				$testTab{$testSuiteName}[1][$testSuiteNameSet{$testSuiteName}{$compKey}{$cpuKey}][1]  = $cpuKey;
				$testTab{$testSuiteName}[2][$testSuiteNameSet{$testSuiteName}{$compKey}{$cpuKey}][1]  = "compilation";
				$testTab{$testSuiteName}[2][$testSuiteNameSet{$testSuiteName}{$compKey}{$cpuKey}+1][1] = "execution";
			}
		#}
	}
	

	
	# compare the two compiler ( compiler1 and compiler2) 
	for ( my $i = 4 ; $i <= $#{$testTab{$testSuiteName}} ; $i++){
		foreach my $cpuComp1 (keys %{$testSuiteNameSet{$testSuiteName}{$compiler1}}) {
			foreach my $cpuComp2 (keys %{$testSuiteNameSet{$testSuiteName}{$compiler2}}) {
				if ((defined $testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler1}{$cpuComp1}][1] )&& 
				     (defined $testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler2}{$cpuComp2}][1])) {
					
					if ($testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler1}{$cpuComp1}][1] =~ m/success/i &&  
						$testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler2}{$cpuComp2}][1] !~ m/success/i || 
						$testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler1}{$cpuComp1}+1][1] =~ m/pass/i &&  
						$testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler2}{$cpuComp2}+1][1] !~ m/pass/i){
					
							my $testInformation = $testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler2}{$cpuComp2}][0];

							$testTab{$testSuiteName}[$i][1][1] = "*";
							$errorDescriptionI{$testSuiteName}{$$testInformation{'testName'}} = $testInformation;
					} elsif ($testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler2}{$cpuComp2}][1] !~ m/success/i ||
							$testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler2}{$cpuComp2}+1][1] !~ m/pass/i) {
						   
						my $testInformation = $testTab{$testSuiteName}[$i][$testSuiteNameSet{$testSuiteName}{$compiler2}{$cpuComp2}][0];
						$errorDescription{$testSuiteName}{$$testInformation{'testName'}} = $testInformation;
					}
				} 
			}
		}
	}

	# statistics
	$#{$testTab{$testSuiteName}}++;
	for ( my $i = 1 ; $i <= $#{$testTab{$testSuiteName}[0]} ; $i++){
		$testTab{$testSuiteName}[$#{$testTab{$testSuiteName}}][$i][1] = 0;
	}
	# count the number of star 
	for ( my $i = 4 ; $i <= $#{$testTab{$testSuiteName}} ; $i++){
		
		if ( defined $testTab{$testSuiteName}[$i][1] && $testTab{$testSuiteName}[$i][1][1] eq "*"){
			$testTab{$testSuiteName}[$#{$testTab{$testSuiteName}}][1][1]++; 
			
		}
	}
	# counting the number of failure 
	
	for ( my $i = 4 ; $i < $#{$testTab{$testSuiteName}} ; $i++){
		for( my $j = 2 ; $j <= $#{$testTab{$testSuiteName}[$i]}; $j++){
			if ( defined $testTab{$testSuiteName}[$i][$j][1]) {
				#~ my $cellValue = "";						
				#~ foreach my $arrayElem (@{$testTab{$testSuiteName}[$i][$j][1]}) {
					#~ $cellValue .= $arrayElem; }
					
				if ( $testTab{$testSuiteName}[$i][$j][1] !~ m/success/i && $testTab{$testSuiteName}[$i][$j][1] !~ m/pass/i ){
					$testTab{$testSuiteName}[$#{$testTab{$testSuiteName}}][$j][1]++; 
					
				
				
				}
			}
		}
	}

	#$testTab{$testSuiteName}[$#{$testTab{$testSuiteName}}+1][1][1] = $starCounter;

	open(TSFILE,'>', "$testSuiteName.htm");
	print  TSFILE "<HTML><head> <link href='style.css' rel='stylesheet' type='text/css'></head> <BODY><table border='0' cellspacing='0' cellpadding='0'>";

	# wrinting test results into an html file
	for ( my $i = 0 ; $i <= $#{$testTab{$testSuiteName}} ; $i++){
			
		for( my $j = 0 ; $j <= $#{$testTab{$testSuiteName}[$i]}; $j++){
			
			my $cell = $testTab{$testSuiteName}[$i][$j];
			
			#$cell should references a table
			if ( defined @$cell) {
				
				if ( defined $$cell[0]) {
					# i whant a link for the cells on the first column
					if ($j==0) {
						print  TSFILE "<td class='testName'><a href='../../".$$cell[0]{'testSuiteName'}."/". $$cell[1].".pas'>". $$cell[1]. "</a></td>";
					} else {
					
						if ($$cell[1] =~ m/success/ || $$cell[1] =~ m/pass/i  ){
							
							if ($j % 2 > 0  && $j >1) {
								print  TSFILE "<td class='even'>";
							} else {
								print  TSFILE "<td>";
							}
							#print  TSFILE "<td>";
						} else {
							print  TSFILE "<td class='error'>";
						}
						#print $$cell[0];
						print TSFILE "<a href='../../testReportSuite/".$$cell[0]{'compName'}."_". $$cell[0]{'testSuiteName'}."_".$$cell[0]{'cpuName'}."/".$$cell[0]{'testName'}.".xml'>";
						print TSFILE  $$cell[1];
						print TSFILE "</a>";
						print TSFILE "</td>";
					}
				} else {
						if ($i == 0 ) {
							print  TSFILE "<td class='compName'>" . $$cell[1] . "</td>";
						}elsif ($i == 1 ) {
							print  TSFILE "<td class='archName'>" . $$cell[1] . "</td>";
						}elsif ($i == 2 ) {
							print  TSFILE "<td class='subTitle'>" . $$cell[1] . "</td>";
						} elsif ($$cell[1] eq "*") {
							print  TSFILE "<td class='comparError'>" . $$cell[1] . "</td>";
						}elsif ($$cell[1] eq "-") {
							print  TSFILE "<td class='separator'>&nbsp</td>";
						} else {
							print  TSFILE "<td>" . $$cell[1] . "</td>";
						}
				}
		
			} else {
				print  TSFILE "<td></td>";
			}
		}
		
		print  TSFILE "</tr>\n";
	}

	print TSFILE '</table></BODY></HTML>';
	close TSFILE;

}

# now generating the latex report
chdir("../latex");
#####################################################################
foreach my $testSuiteName (keys %testTab) {
	
	mkdir "$testSuiteName-file" if not -e "$testSuiteName-file";
	# if the report doesnt already exists
	if (not -e "$testSuiteName-report.tex") {
	
		open(MAINREPORT,'>', "$testSuiteName-report.tex");
		open(HEADER, '<', "../../header.tex");
		my @header = <HEADER>; 
		close HEADER;

		# write the header
		print MAINREPORT @header;
		
		if (not -e "$testSuiteName-file/intro.tex") {
			open(INTRO, '>', "$testSuiteName-file/intro.tex");
			
			close INTRO;
		}
		print MAINREPORT "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
		print MAINREPORT "%Intro\n";
		
		print MAINREPORT "\\include{$testSuiteName-file/intro}\n\n";

		print MAINREPORT "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
		print MAINREPORT "%Important Errors\n\n";

		# search important tests
		foreach my $testNameKey (sort keys %{$errorDescriptionI{$testSuiteName}}) {
			my $testInformation = $errorDescriptionI{$testSuiteName}{$testNameKey};

			writeLatex $testInformation;
			
			print MAINREPORT "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
			print MAINREPORT "\\input{$$testInformation{'testSuiteName'}-file/$$testInformation{'testName'}}\n\n";
				
		}
		
		print MAINREPORT "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
		print MAINREPORT "%Errors\n\n";

		# search important tests
		foreach my $testNameKey (sort keys %{$errorDescription{$testSuiteName}}) {
			my $testInformation = $errorDescription{$testSuiteName}{$testNameKey};

			#$testTab{$testSuiteName}[$i][1][1] = "*";
			
			#print "$testNameKey ";

			writeLatex $testInformation;
			
			print MAINREPORT "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
			print MAINREPORT "\\input{$$testInformation{'testSuiteName'}-file/$$testInformation{'testName'}}\n\n";
		}
		
		# search other failures
		
		
		print MAINREPORT "\\end{document}";
		close MAINREPORT;
	}
}
