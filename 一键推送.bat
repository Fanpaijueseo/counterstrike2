@echo off
chdir /d E:\Git_tb\counterstrike2
chcp 65001 >nul
echo ========== 开始检测文件变更 ==========
git add -u
git add . --ignore-missing

git diff --cached --quiet
if %errorlevel% equ 0 (
    echo 当前无新增/修改文件，无需推送
    pause
    exit
)

echo ========== 生成本地提交 ==========
git commit -m "自动更新：%date% %time%"
echo ========== 正在推送（实时显示上传进度） ==========
:: 加--progress强制展示上传进度
git push --progress origin main
echo.
echo ========== 上传完成 ==========
pause