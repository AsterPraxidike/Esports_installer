this is the result of having 30+ PCs that need new software installed on them. 

installer files can be added or removed from the "game software" folder as well as "System software" and they will be installed. this allows customiszation as to what softwares can be installed. 

as we use "Phoenix installer" as a monitoring software, ew need that installed as well but that needs to be installed last. 

additionally, it will set the wallpaper from the "Media" folder from the file "Maverick Wallpaper.png"



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

