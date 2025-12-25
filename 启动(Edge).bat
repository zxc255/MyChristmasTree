@echo off
setlocal

:: 获取当前目录下的 index.html 路径
set "HTML_FILE=%~dp0index.html"

:: 设置一个临时的 Edge 用户目录，隔离环境，互不影响
set "TEMP_PROFILE=%TEMP%\ChristmasTreeEdgeProfile"

echo 正在尝试启动 Microsoft Edge 浏览器...
echo ---------------------------------------------------
echo 请注意：
echo 脚本将打开一个独立的 Edge 窗口。
echo 已开启本地文件读取权限 (解决 CORS 报错)。
echo ---------------------------------------------------

:: 1. 尝试查找 Edge (x86 目录，最常见)
if exist "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" (
    set "EDGE_PATH=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    goto found
)

:: 2. 尝试查找 Edge (Program Files 目录)
if exist "C:\Program Files\Microsoft\Edge\Application\msedge.exe" (
    set "EDGE_PATH=C:\Program Files\Microsoft\Edge\Application\msedge.exe"
    goto found
)

:: 3. 尝试从注册表查找 (作为备选)
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe" /ve 2^>nul') do set "EDGE_PATH=%%b"
if defined EDGE_PATH goto found

echo [错误] 找不到 Microsoft Edge！请确认你的系统已安装 Edge 浏览器。
pause
exit /b

:found
echo 找到 Edge: "%EDGE_PATH%"

:: 启动 Edge，带上“允许本地文件访问”参数 (注意：这一行很长，不要手动换行)
"%EDGE_PATH%" --allow-file-access-from-files --user-data-dir="%TEMP_PROFILE%" "%HTML_FILE%"

echo 启动成功！
pause