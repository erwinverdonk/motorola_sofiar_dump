#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e4c55b067034ad4bcfe280753d2f8684dfd9aa35; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:f42a785af1f2beeb2f73676a1b0160ee95b62fb7 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e4c55b067034ad4bcfe280753d2f8684dfd9aa35 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
