
fn mountdata(number) {
	if $number == "1" {
    	sudo mount /dev/sdc1 /mnt/data
    	return
    }
	if $number == "2" {
		sudo mount /dev/sde1 /mnt/data2
		return
	}
	
	echo "unknow data disk:" + $number    
}

fn mountusb() {
    sudo mount /dev/sdf1 /mnt/usb
}

bindfn mountdata mountdata
bindfn mountusb mountusb
