define Device/globalscale_mochabin
  $(call Device/Default-arm64)
  DEVICE_VENDOR := Globalscale
  DEVICE_MODEL := MOCHAbin
  SOC := armada-7040
endef
TARGET_DEVICES += globalscale_mochabin

define Device/marvell_armada7040-db
  $(call Device/Default-arm64)
  DEVICE_VENDOR := Marvell
  DEVICE_MODEL := Armada 7040 Development Board
  DEVICE_DTS := armada-7040-db
  IMAGE/sdcard.img.gz := boot-img-ext4 | sdcard-img-ext4 | gzip | append-metadata
endef
TARGET_DEVICES += marvell_armada7040-db

define Device/marvell_armada8040-db
  $(call Device/Default-arm64)
  DEVICE_VENDOR := Marvell
  DEVICE_MODEL := Armada 8040 Development Board
  DEVICE_DTS := armada-8040-db
  IMAGE/sdcard.img.gz := boot-img-ext4 | sdcard-img-ext4 | gzip | append-metadata
endef
TARGET_DEVICES += marvell_armada8040-db

define Device/marvell_macchiatobin-doubleshot
  $(call Device/Default-arm64)
  DEVICE_VENDOR := SolidRun
  DEVICE_MODEL := MACCHIATObin
  DEVICE_VARIANT := Double Shot
  DEVICE_ALT0_VENDOR := SolidRun
  DEVICE_ALT0_MODEL := Armada 8040 Community Board
  DEVICE_ALT0_VARIANT := Double Shot
  DEVICE_PACKAGES += kmod-i2c-mux-pca954x
  DEVICE_DTS := armada-8040-mcbin
  SUPPORTED_DEVICES := marvell,armada8040-mcbin-doubleshot marvell,armada8040-mcbin
endef
TARGET_DEVICES += marvell_macchiatobin-doubleshot

define Device/marvell_macchiatobin-singleshot
  $(call Device/Default-arm64)
  DEVICE_VENDOR := SolidRun
  DEVICE_MODEL := MACCHIATObin
  DEVICE_VARIANT := Single Shot
  DEVICE_ALT0_VENDOR := SolidRun
  DEVICE_ALT0_MODEL := Armada 8040 Community Board
  DEVICE_ALT0_VARIANT := Single Shot
  DEVICE_PACKAGES += kmod-i2c-mux-pca954x
  DEVICE_DTS := armada-8040-mcbin-singleshot
  SUPPORTED_DEVICES := marvell,armada8040-mcbin-singleshot
endef
TARGET_DEVICES += marvell_macchiatobin-singleshot

define Device/mikrotik_rb5009
  DEVICE_DTS := armada-7040-rb5009
  DEVICE_DTS_DIR := $(DTS_DIR)/marvell
  $(call Device/FitImageLzma)
  DEVICE_VENDOR := MikroTik
  DEVICE_MODEL := RB5009
  SOC := armada-7040
  KERNEL_LOADADDR := 0x22000000
  KERNEL_INITRAMFS = $$(KERNEL) | aux-loader
  KERNEL_INITRAMFS_SUFFIX := -fit-uImage.elf
  BLOCKSIZE := 64k
  IMAGE_SIZE := 15360k
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := append-kernel | pad-to $$(BLOCKSIZE) | \
  	append-rootfs | pad-rootfs | check-size | append-metadata
  DEVICE_PACKAGES += kmod-i2c-gpio
endef
TARGET_DEVICES += mikrotik_rb5009

define Device/iei_puzzle-m901
  $(call Device/Default-arm64)
  DEVICE_VENDOR := iEi
  DEVICE_MODEL := Puzzle-M901
  SOC := cn9131
  IMAGE/sdcard.img.gz := boot-img-ext4 | sdcard-img-ext4 | gzip | append-metadata
endef
TARGET_DEVICES += iei_puzzle-m901

define Device/iei_puzzle-m902
  $(call Device/Default-arm64)
  DEVICE_VENDOR := iEi
  DEVICE_MODEL := Puzzle-M902
  SOC := cn9132
  IMAGE/sdcard.img.gz := boot-img-ext4 | sdcard-img-ext4 | gzip | append-metadata
endef
TARGET_DEVICES += iei_puzzle-m902
