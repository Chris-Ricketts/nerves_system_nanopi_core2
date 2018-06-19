echo "Running Nerves U-Boot script"

setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait

fatload mmc 0 $kernel_addr_r Image

fatload mmc 0 $fdt_addr_r sun50i-h5-nanopi-neo-core2.dtb

booti $kernel_addr_r - $fdt_addr_r

echo "Nerves boot failed!"
