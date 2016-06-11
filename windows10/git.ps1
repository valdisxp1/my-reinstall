wget https://github.com/git-for-windows/git/releases/download/v2.8.3.windows.1/Git-2.8.3-64-bit.exe -O $env:temp\Git-2.8.3-64-bit.exe
& $env:temp\Git-2.8.3-64-bit.exe /SILENT
rm $env:temp\Git-2.8.3-64-bit.exe
wget https://download.tortoisegit.org/tgit/2.1.0.0/TortoiseGit-2.1.0.0-64bit.msi -O $env:temp\TortoiseGit-2.1.0.0-64bit.msi
& $env:temp\TortoiseGit-2.1.0.0-64bit.msi /passive /norestart
rm $env:temp\TortoiseGit-2.1.0.0-64bit.msi