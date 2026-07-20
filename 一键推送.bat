@echo off
chdir /d E:\Git_tb\counterstrike2
echo ========== 开始提交并推送 ==========
git add .
git commit -m "自动更新：%date% %time%"
git push origin main
echo.
echo ========== 上传完成 ==========
pause