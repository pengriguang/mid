Set wshShell = CreateObject("WScript.shell")
wshShell.run "mfgtool2.exe -c ""linux"" -l ""NAND Flash""  -s ""board=sabreauto"" -s ""6uluboot=14x14"" -s ""nand=nand"" -s ""6uldtb=14x14"" -s ""ddrsize=256"" -s ""nanddtb=gpmi-weim"" -s ""part_uboot=0"" -s ""part_kernel=2"" -s ""part_dtb=3"" -s ""part_logo=4"" -s ""part_rootfs=5"" -s ""rootfs=fsl-image-qt5-myd-y6ul14x14.rootfs.tar.bz2"""
Set wshShell = Nothing
