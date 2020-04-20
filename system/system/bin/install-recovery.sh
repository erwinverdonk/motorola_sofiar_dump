#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:58b5381934912bfb3bae5cecf6472d921b1d6859; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:0d8188c4252683ecc1aa183190598c6b6ed22bfc \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:58b5381934912bfb3bae5cecf6472d921b1d6859 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
