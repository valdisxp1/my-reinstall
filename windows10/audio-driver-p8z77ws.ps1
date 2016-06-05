wget http://dlcdnet.asus.com/pub/ASUS/mb/LGA1155/P8Z77-WS/Driver/Audio_20120921.zip -O $env:temp\Audio_20120921.zip
Expand-Archive $env:temp\Audio_20120921.zip $env:temp
#& $env:temp\Audio_20120921\AsusSetup.exe /S
#& $env:temp\Audio_20120921\NoHotfix\AsusSetup.exe /S
# the installer for the driver itself only thing that takes /S
& $env:temp\Audio_20120921\Driver\Setup.exe /S
rm $env:temp\Audio_20120921.zip
rm $env:temp\Audio_20120921 -r