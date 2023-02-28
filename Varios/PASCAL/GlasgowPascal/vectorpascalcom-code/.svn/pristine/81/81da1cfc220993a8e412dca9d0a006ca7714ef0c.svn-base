
@echo off
rem
rem this batch file build and run the test specified
rem

setlocal

rem setting up some directories if they don't exist
set prog_dir=testProgSuite
set report_dir=testReportSuite

if not exist %prog_dir% (
	echo creating directory %prog_dir%
	mkdir %prog_dir%
)

if not exist %report_dir% (
	echo creating directory %report_dir%
	mkdir %report_dir%
)



rem getting some variable from the command line
set test_suite_source_dir=%1
set test_name=%2

set compiler=tpc

rem creating additionnal variables
set programme_dir=%prog_dir%\%compiler%_%test_suite_source_dir%_486
set compil_report_dir=%report_dir%\%compiler%_%test_suite_source_dir%_486

set prog_full_name=%programme_dir%\%test_name%.exe
set report_full_name= %compil_report_dir%\%test_name%.txt
set src_full_name=%test_suite_source_dir%\%test_name%


set error_tmp=compilation.errors
set jvm_error_tmp=jvm.errors






rem
rem creating some directories
rem

if not exist %programme_dir% (
	echo creating directory %programme_dir%
	mkdir %programme_dir%
)

if not exist %compil_report_dir% (
	echo creating directory %compil_report_dir%
	mkdir %compil_report_dir%
)

if not exist temp (
	echo creating directory temp
	mkdir temp
)



rem building and running the test 
rem compilation report 



	@echo. 
	@echo ---- building %test_name% with tp7 ----

	@echo %compiler% -Etemp %src_full_name%.pas 

	rem building the test and redirecting the outputs
	%compiler% -Etemp %src_full_name%.pas 1> %error_tmp% 2> %jvm_error_tmp%	
	move temp\%test_name%.exe %programme_dir%


	rem produces the compilation report	
	if exist %report_full_name% ( del %report_full_name% )			

	rem first we put some general informations

	@echo # tn = name of the test > %report_full_name%
	@echo tn:%test_name% >> %report_full_name%
	
	@echo # sn = name of the test suite >> %report_full_name%
	@echo sn:%test_suite_source_dir% >> %report_full_name%

	@echo # an = name of the targeted architecture >> %report_full_name%
	@echo an:%target_cpu% >> %report_full_name%

	@echo # an = name of the operating system >> %report_full_name%
	@echo on:win >> %report_full_name%

	@echo # cn = name of the compiler >> %report_full_name%
	@echo vn:tp7 >> %report_full_name%


	rem @findstr /b "{:" %src_full_name%.pas >> %report_full_name%
	
	rem then we put the compilation errors
	@echo # ce = compilation errors >> %report_full_name%
	
	for /F "usebackq delims=§" %%a in (`type compilation.errors`) do (
		echo ce:%%a >> %report_full_name%
		echo ouput : %%a
	)	

	rem then we put the jvm errors
	@echo # je = jvm errors >> %report_full_name%	

	for /F "usebackq delims=§" %%a in (`type jvm.errors`) do (
		echo je:%%a >> %report_full_name%
	)	

	del %jvm_error_tmp%
	del %error_tmp%
	
	
	rem then, we put the results of the execution of the test, if the compilation didn't fail

	@echo # cr = compilation results results >> %report_full_name%
	if exist %prog_full_name% (
		
		@echo cr:success >> %report_full_name%
		@echo # execution results >> %report_full_name%
		
		for /F "usebackq delims=§" %%a in (`%prog_full_name%`) do (
			echo er:%%a >> %report_full_name%
			echo result  = %%a
		)	

	rem		 >> %report_full_name%
	) else (
		@echo cr:failure >> %report_full_name%

	)


endlocal

