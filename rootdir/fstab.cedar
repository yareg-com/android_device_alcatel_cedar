# Android fstab file.

#<src>                                                  <mnt_point>         <type>    <mnt_flags and options>                                                   <fs_mgr_flags>

# The filesystem that contains the filesystem checker binary (typically /system) cannot specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK

/dev/block/platform/omap/omap_hsmmc.1/by-name/system     /system             ext4      noatime,noauto_da_alloc,nodiratime,barrier=0,ro                           wait
/dev/block/platform/omap/omap_hsmmc.1/by-name/efs        /factory            ext4      noatime,noauto_da_alloc,nodiratime,barrier=0,ro                           wait
/dev/block/platform/omap/omap_hsmmc.1/by-name/cache      /cache              ext4      noatime,noauto_da_alloc,nosuid,nodev,nodiratime,barrier=0,errors=panic    wait,check
/dev/block/platform/omap/omap_hsmmc.1/by-name/userdata   /data               ext4      noatime,noauto_da_alloc,nosuid,nodev,nodiratime,barrier=0,errors=panic    wait,check,encryptable=/dev/block/platform/omap/omap_hsmmc.1/by-name/crypto
/dev/block/platform/omap/omap_hsmmc.1/by-name/custom     /custom             ext4      noatime,noauto_da_alloc,nodiratime,barrier=0,ro                           wait
/dev/block/platform/omap/omap_hsmmc.1/by-name/misc       /misc               emmc      defaults                                                                  defaults

/dev/block/platform/omap/omap_hsmmc.1/by-name/root       /boot               emmc      defaults                                                                  recoveryonly
/dev/block/platform/omap/omap_hsmmc.1/by-name/recovery   /recovery           emmc      defaults                                                                  recoveryonly
/dev/block/platform/omap/omap_hsmmc.1/by-name/bootloader /bootloader         emmc      defaults                                                                  recoveryonly
/dev/block/platform/omap/omap_hsmmc.1/by-name/xloader    /xloader            emmc      defaults                                                                  recoveryonly

# Storage devices
/devices/platform/omap/omap_hsmmc.0/mmc_host/mmc1        auto                auto      defaults                                                                  voldmanaged=sdcard0:auto,noemulatedsd
/devices/platform/omap/musb-omap2430/musb-hdrc           auto                auto      defaults                                                                  voldmanaged=usbdisk:auto
