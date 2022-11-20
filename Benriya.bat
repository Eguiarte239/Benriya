@echo off
:k
    echo "What option do you want?" 
    echo "A:Check disk for problems (Enter as administrator to use this option)" 
    echo "B:Check connection"
    echo "C:Create new folder and move files to it" 
    echo "D:Read a file safely"
    echo "E:Check all drivers"
    echo "F:Check system info"
    echo "G:Check IP configuration"
    echo "H:Delete a file"
    echo "I:Shutdown system after amount of time"
    echo "J:Exit"
    choice /c ABCDEFGHIJ
    if %ERRORLEVEL%==10 (goto j)
    if %ERRORLEVEL%==9 (goto i)
    if %ERRORLEVEL%==8 (goto h)
    if %ERRORLEVEL%==7 (goto g)
    if %ERRORLEVEL%==6 (goto f)
    if %ERRORLEVEL%==5 (goto e)
    if %ERRORLEVEL%==4 (goto d)
    if %ERRORLEVEL%==3 (goto c)
    if %ERRORLEVEL%==2 (goto b)
    if %ERRORLEVEL%==1 (goto a)

:a
    echo Let's start. Press any key and wait.
    pause >nul
    cls
    CHKDSK
    pause >nul
    cls
    goto k

:b
    ping 8.8.8.8
    pause >nul
    cls 
    goto k

:c
    set /p newDir=enter the name for the folder: 
    md %newDir%
    move %userprofile%\desktop\* %userprofile%\desktop\%newDir%
    pause >nul
    cls
    goto k

:d
    set /p fileToRead=Enter the file you want to read safely: 
    type %userprofile%\desktop\%fileToRead%
    pause >nul
    cls
    goto k

:e
    driverquery 
    pause >nul
    cls
    goto k

:f
    systeminfo
    pause >nul
    cls
    goto k

:g
    ipconfig
    pause >nul
    cls 
    goto k

:h
    set /p fileToDel=Enter the file you want to delete: 
    del %userprofile%\desktop\%fileToDel%
    pause >nul
    cls
    goto k

:i
    set /p mins=Enter number of minutes to wait until shutdown: 
    set /a mins=%mins%*60
    shutdown /s /t %mins%
    pause >nul
    cls
    goto k

:j
    exit /B