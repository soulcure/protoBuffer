if exist %~dp0bin\ (
    echo bin exist
) else (
    md %~dp0bin\
)

echo gen proto begin...

set "currPath=%~dp0" 

::编译java_proto的指令
set JAVA_COMPILER_PATH="D:\tools\protoc-3.7.1-win64\bin\protoc.exe"

::存放编译后的java文件
set JAVA_TARGET_PATH=%currPath%\bin


::遍历所有proto文件
echo --------JAVA----------------
for /f "delims=" %%i in ('dir /b ".\*.proto"') do (
    echo %%i
    %JAVA_COMPILER_PATH% --java_out=%JAVA_TARGET_PATH% %%i
)

echo gen proto end...


PAUSE