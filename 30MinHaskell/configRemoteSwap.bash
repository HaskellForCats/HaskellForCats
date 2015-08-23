# swap will be needed for ram under two gigs
       dd if=/dev/zero of=/swapfile bs=1M count=2048 &&
               mkswap /swapfile &&
                swapon /swapfile 
