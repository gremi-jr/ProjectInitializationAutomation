@echo off

set fn=%1
set flag=%2
set visibility=%3
cd /d %~dp0



If "%1"=="" if "%1" == "/?" if "%1" == "/help" (
    goto:write_Help
) else (
    goto:write_Help
) 


if "%2"=="g" (
    python remote.py %fn% %flag% %visibility%
) else (
    if "%2"=="l" (
        python local.py %fn%
    )
)


:write_Help
    echo.
    echo Syntax: create ^<name^> ^<g/l^> ^<public/private^>
    echo.
    echo Optinons: 
    echo    ^<name^>        Name of the project
    echo    ^<g^>           GitHub repository 
    echo    ^<l^>           Local repository
    echo    ^<public^>      Public repository (only in GitHub repositories)
    echo    ^<private^>     Private repository (only in GitHub repositories)
    echo.
EXIT /B 0

