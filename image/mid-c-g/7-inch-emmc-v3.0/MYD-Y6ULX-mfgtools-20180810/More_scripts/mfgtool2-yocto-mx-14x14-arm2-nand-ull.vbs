Set wshShell = CreateObject("WScript.shell")
wshShell.run "mfgtool2.exe -c ""linux"" -l ""NAND Flash"" -s ""sxuboot=14x14arm2""  -s ""sxdtb=sabreauto"" -s ""board=sabreauto"" -s ""nand=nand"" -s ""nanddtb=gpmi-weim"" -s ""lite=l"" -s ""part_uboot=0"" -s ""part_kernel=1"" -s ""part_dtb=2"" -s ""part_rootfs=3""   "
Set wshShell = Nothing
