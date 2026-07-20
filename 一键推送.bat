@echo off
:: 强制切换仓库目录
chdir /d E:\Git_tb\counterstrike2
:: 控制台全局UTF-8，屏蔽多余输出
chcp 65001 >nul
:: 关键：强制Git使用UTF-8编码提交注释，根治提交记录乱码
set LC_ALL=en_US.UTF-8
set LANG=en_US.UTF-8

echo ========== 开始扫描文件变更 ==========
git add -u
git add .

:: 无变更直接退出
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo 未检测到新增/修改文件，无需推送
    pause
    exit
)

echo ========== 生成本地提交记录 ==========
git commit -m "自动更新：%date% %time%"

echo ========== 同步远程仓库最新内容 ==========
git pull origin main --rebase

echo ========== 正在推送（实时显示上传进度） ==========
git push --progress origin main

echo.
echo ====================== 全部上传完成 ======================
pause