
@echo off
rem
rem this batch file build and run the test specified
rem

setlocal

rem setting up some directories if they don't exist
set prog_dir=testProgSuite
set report_dir=testReportSuite

rem getting some variable from the command line
set comp_name=%1
set test_suite_source_dir=%2
set target_cpu=%3
set test_name=%4
set flag=%5
set novpwords= -USEVPWORDS

rem creating additionnal variables
set programme_dir=%prog_dir%\%comp_name%_%test_suite_source_dir%_%target_cpu%
set compil_report_dir=%report_dir%\%comp_name%_%test_suite_source_dir%_%target_cpu%

set prog_full_name=%programme_dir%\%test_name%.exe
set report_full_name= %compil_report_dir%\%test_name%.xml
set src_full_name=%test_suite_source_dir%\%test_name%.pas


set error_tmp=compilation.errors
set jvm_error_tmp=jvm.errors

set compiler = 

rem selecting the compiler
if "%comp_name%"=="vpt" (
       
	set novpwords=-NOVPWORDS
	set compiler=java -Xmx125m -Dmmpcdir=%mmpcdir% -jar ..\mmpc\mmpc.jar %test_suite_source_dir%\%test_name%
        set compiler_flags= -o%prog_full_name% -fcoff -opt0 -cpu%target_cpu% -U -NOVPWORDS -BOEHM
	set post_compil=echo .
	set exec_file=%prog_full_name%

)
if "%comp_name%"=="vpa" (
	set compiler=java -Xmx125m -Dmmpcdir=%mmpcdir% -jar ..\mmpc\mmpc.jar %test_suite_source_dir%\%test_name%
        set compiler_flags= -o%prog_full_name% -fcoff -opt1 -cpu%target_cpu% -BOEHM -U %novpwords%
	set post_compil=echo .
	set exec_file=%prog_full_name%
)
if "%comp_name%"=="vpb" (
	set compiler=java -Xmx125m -Dmmpcdir=%mmpcdir% -jar ..\mmpc\mmpc.jar %test_suite_source_dir%\%test_name%
        set compiler_flags= -o%prog_full_name% -fcoff -opt2  -cpu%target_cpu% -BOEHM -U %novpwords%
	set post_compil=echo .
	set exec_file=%prog_full_name%
)	 
if "%comp_name%"=="vp" (
	set compiler=java -Xmx125m -Dmmpcdir=%mmpcdir% -jar ..\mmpc\mmpc.jar %test_suite_source_dir%\%test_name%
        set compiler_flags= -o%prog_full_name% -fcoff -opt0 -cpu%target_cpu% -NOBOEHM -U %novpwords% %flag%
	set post_compil=echo .
	set exec_file=%prog_full_name%
)
if "%comp_name%"=="tp7" (
	set compiler=tpc %src_full_name%
	set compiler_flags= -Etemp 
	set post_compil=move temp\%test_name%.exe %programme_dir%
	set exec_file=%prog_full_name%
	set src_full_name=%test_suite_source_dir%\%test_name%.pas
)
if "%comp_name%"=="gpc" (
	set compiler=gpc %src_full_name%
	set compiler_flags= -o%prog_full_name%
	set post_compil=echo .
	set exec_file=%prog_full_name%
)
if "%comp_name%"=="ipc" (
	set compiler=ipc %src_full_name%
	set compiler_flags= 
	set post_compil=move %test_name%.ivm %programme_dir%
	set exec_file=ivm %programme_dir%\%test_name%.ivm
	set prog_full_name=%programme_dir%\%test_name%.ivm
)

if "%comp_name%"=="fpc" (
	set compiler=fpc %src_full_name%
	set compiler_flags= -o%prog_full_name%
	set post_compil=
	set exec_file=%prog_full_name%
)


if not exist %prog_dir% (
	echo creating directory %prog_dir%
	mkdir %prog_dir%
)

if not exist %report_dir% (
	echo creating directory %report_dir%
	mkdir %report_dir%
)



rem we need to put %mmpcdir% in the path in order to call nasm
rem hack hack hack
set path=%path%;..\mmpc

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


rem
rem building the c library if needed

	@echo building rtl.s
	gcc -g -S %mmpcdir%\rtl.c

rem building and running the test 
rem compilation report 



	@echo. 
	@echo ---- building %test_name% for %target_cpu% ----

	@echo %compiler% %compiler_flags%

	rem building the test and redirecting the outputs
	%compiler%  %compiler_flags% 1> %error_tmp% 2> %jvm_error_tmp%	
	%post_compil%
	
	rem produces the compilation report	
	if exist %report_full_name% ( del %report_full_name% )			


	rem first we put some general informations
	@echo ^<?xml version="1.0" encoding="ISO-8859-1"?^> > %report_full_name%
	 @echo ^<?xml-stylesheet type="text/css" href="../reportStyle.css"?^> >> %report_full_name%
	@echo ^<testReport^>  >> %report_full_name%
	
	@echo ^<testName^> %test_name% ^</testName^>  >> %report_full_name%

	@echo ^<testSuiteName^>%test_suite_source_dir% ^</testSuiteName^> >> %report_full_name%
	
	@echo ^<cpuName^> %target_cpu%  ^</cpuName^> >> %report_full_name%

	@echo ^<osName^> win ^</osName^>  >> %report_full_name%


	@echo ^<compilerName^> %comp_name% ^</compilerName^> >> %report_full_name%


	rem @findstr /b "{:" %src_full_name% >> %report_full_name%
				
	rem then we put the compilation errors
	rem @echo # ce = compilation errors >> %report_full_name%
	@echo ^<compilationOutput^> >> %report_full_name%
	for /F "usebackq delims=§" %%a in (`type compilation.errors`) do (
		echo ^<compilationOutputLine^> %%a ^</compilationOutputLine^> >> %report_full_name%
		echo ouput : %%a
	)	
	@echo ^</compilationOutput^> >> %report_full_name%
	rem then we put the jvm errors
	
	@echo ^<javaOutput^> >> %report_full_name%
	for /F "usebackq delims=§" %%a in (`type jvm.errors`) do (
		echo ^<javaOutputLine^> %%a ^</javaOutputLine^> >> %report_full_name%
	)	
	@echo ^</javaOutput^> >> %report_full_name%
	
	del %jvm_error_tmp%
	del %error_tmp%
	
	rem then, we put the results of the execution of the test, if the compilation didn't fail

	rem @echo # cr = compilation results results >> %report_full_name%
	if exist %prog_full_name% (
		@echo ^<compilationResult^> success ^</compilationResult^>  >> %report_full_name%
		
		@echo ^<executionResult^> >> %report_full_name%
		for /F "usebackq delims=§" %%a in (`%exec_file%`) do (
		echo ^<executionResultLine^>  %%a ^</executionResultLine^> >> %report_full_name%
		echo result  = %%a
		)	
		@echo ^</executionResult^> >> %report_full_name%
	rem		 >> %report_full_name%
	) else (
		@echo ^<compilationResult^>  ^<executionResultLine^>  FAIL ^</executionResultLine^> ^</compilationResult^>  >> %report_full_name%

	)
	@echo ^</testReport^> >> %report_full_name%

:end

endlocal


