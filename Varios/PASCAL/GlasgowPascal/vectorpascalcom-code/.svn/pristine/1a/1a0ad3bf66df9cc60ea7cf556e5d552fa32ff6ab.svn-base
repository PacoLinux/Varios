@echo off
rem
rem this batch file build the test suite incrementally
rem usage build_run_test_suite compiler sourcedir cpu

setlocal



rem setting up variables
set compiler=%1
set test_suite_source_dir=%2
set flag=%4

rem building the test suite and running the tests for each targeted architecture
rem compilation report 

:LOOP
if "%3" == "" ( goto END )

set target_cpu=%3
set programme_dir=testProgSuite\win_%test_suite_source_dir%_%target_cpu%

for %%f in (%test_suite_source_dir%\*.pas) do (
			
		if not exist %programme_dir%\%%~nf.exe (
			@echo %programme_dir%\%%~nf.exe
			call build_run_test %compiler% %test_suite_source_dir% %target_cpu% %%~nf	%flag%	
		)

)

shift /3

goto LOOP
:END


rem now generate everything
perl buildReport.pl

rem gathering in a single directory
if not exist "ISO_report" (
	mkdir ISO_report
)

perl test.pl
endlocal
