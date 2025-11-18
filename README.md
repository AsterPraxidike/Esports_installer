## ⚙️ Script Workflow
1. **Banner & Title**
   - Sets console title and prints header.

2. **Working Directory**
   - Switches to the script’s folder (`%~dp0`) so all paths are relative.

4. **Installers**
   - Runs all `.exe` and `.msi` files inside `System Software` and `Game Software`.
   - Each installer is launched sequentially, with start and finish times logged.

5. **Wallpaper Reset**
   - Applies `Media\Maverick Wallpaper.png` as the desktop background. name whatever wallpaper is needed to be this.
   - If missing, logs an error instead.
   - Refresh is triggered by:
     ```bat
     reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%WALLPAPER%" /f
     RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
     ```

6. **Phoenix Installer (optional)**
   - Code is present but commented out. If enabled, installs `Phoenix Installer.exe` from the root folder last.

7. **Completion Message**
   - Prints summary and pauses before exit.

