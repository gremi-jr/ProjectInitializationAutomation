@echo off

set fn=%1
set flag=%2
set visibility=%3
cd /d %~dp0

If "%1"=="" (
    echo "error"
) else ( 
    if "%2"=="g" (
        python remote.py %fn% %flag% %visibility%
        ) else (
            if "%2"=="l" (
                python local.py %fn%
            )
        )
    )
