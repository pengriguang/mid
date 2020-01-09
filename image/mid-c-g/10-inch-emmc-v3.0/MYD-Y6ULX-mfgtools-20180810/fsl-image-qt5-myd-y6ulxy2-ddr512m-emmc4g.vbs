Set wshShell = CreateObject("WScript.shell")
wshShell.run "mfgtool2.exe -c ""linux"" -l ""eMMC""  -s ""mmc=1"" -s ""board=sabreauto"" -s ""lite=l"" -s ""6uluboot=14x14"" -s ""ddrsize=512"" -s ""6uldtb=14x14"" -s ""rootfs=fsl-image-qt5-myd-y6ull14x14.rootfs.tar.bz2"""
Set wshShell = Nothing
