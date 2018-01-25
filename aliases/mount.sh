
fn mountdata() {
    sudo mount /dev/sda1 /mnt/data
}

fn mountusb() {
    sudo mount /dev/sde1 /mnt/usb
}

bindfn mountdata mountdata
bindfn mountusb mountusb
