#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:c4a2c10d22efd25cc28fe058a03eae8bacc0ea68; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:0d2cf608cf39be40c078e0569a900c5610d4a3e9 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:c4a2c10d22efd25cc28fe058a03eae8bacc0ea68 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
