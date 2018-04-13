ECHO %DATE% %TIME% >>C:\temp\%computername%_debug.log
REM To do all things locally, without psexec etc
net use T: \\server\soft\deploy /PERSISTENT:NO >>C:\temp\%computername%_debug.log
setlocal enabledelayedexpansion
REM Just do all cmd's with name *_auto_deploy.*
FOR /R "T:\" %%I IN (*_auto_deploy.*) DO (
	call T:\cmd\check.cmd %%I>>C:\temp\%computername%_debug.log
)
endlocal
timeout 2

REM Don't work properly if script is running under LOCAL MACHINE privilegies
net use T: /delete /yes